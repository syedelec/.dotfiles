#!/usr/bin/env bash

set -e

###############################################################################
#                                   global                                    #
###############################################################################

###################
#  documentation  #
###################

# Update mirrorlist with the fastest mirrors
# sudo pacman-mirrors --fasttrack

# Limit to 5 mirrors
# An optional number can be supplied to limit the number of mirrors
# in the mirrorlist
# sudo pacman-mirrors --fasttrack 5

# Mirrors for your country only
# Not all countries have mirrors, if geoip returns a country not
# in the pool all mirrors will be used.
# sudo pacman-mirrors --geoip

# Mirrors for Canada and United States
# sudo pacman-mirrors --country United_States,Canada

# Always run after pacman-mirrors
# sudo pacman -Syyu

###############
#  variables  #
###############

DIR_DEVEL="${HOME}/devel/"
DIR_PERSONAL="${DIR_DEVEL}/personal"
DIR_REPOS="${DIR_DEVEL}/repos"

DIR_REPOS_DEV="${DIR_REPOS}/dev"
DIR_REPOS_TOOLS="${DIR_REPOS}/tools"
DIR_REPOS_EMBEDDED="${DIR_REPOS}/embedded"
DIR_REPOS_UI="${DIR_REPOS}/ui"

DIR_DOTFILES="${HOME}/.dotfiles"

URL_ARM_32_TOOLCHAIN_11_2="https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-arm-none-linux-gnueabihf.tar.xz"
URL_ARM_64_TOOLCHAIN_11_2="https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz"
DIR_TOOLCHAINS="${HOME}/.toolchains"
DIR_ARM_32_TOOLCHAIN="${DIR_TOOLCHAINS}/11.2/aarch32"
DIR_ARM_64_TOOLCHAIN="${DIR_TOOLCHAINS}/11.2/aarch64"

TEMP_GNOME_CONFIG=/tmp/org.gnome.ini.tmp
BACKGROUND_IMAGE="${HOME}/.wallpapers/wallpaper_001.jpg"
SCREENSAVER_IMAGE="${HOME}/.wallpapers/wallpaper_002.jpg"

##################
#  repositories  #
##################

REPO_DOTFILES="https://github.com/syedelec/.dotfiles.git"
REPO_TILIX="https://github.com/syedelec/tilix.git"

############
#  pacman  #
############

pacman_groups=(
    base base-devel dlang-dmd multilib-devel go rust-src
)
pacman_utils=(
    cpio unzip cmake xclip xsel xterm unzip evtest cairo net-tools pam
    xcb-util-image xcb-util-keysyms tk dos2unix ncdu cups help2man repo
    nmap gnu-netcat lsof detox unzip sshfs lzop aspell-en bind-tools ctags
    boost catch2 fmt mbedtls nlohmann-json acpica dtc autoconf-archive
)
pacman_dev=(
    vim
    dub ldc meson
    python-pip
)
pacman_tools=(
    docker openssl wget curl git ripgrep uncrustify valgrind mplayer
    fd bat fzf rofi stow the_silver_searcher tree yay lynx firefox
    cmus cppcheck shellcheck meld android-tools neofetch cargo efitools
    deluge minicom evince dialog tk jq sd diff-so-fancy texlive-core
    bash-language-server python-lsp-server clang jdk11-openjdk
    jre11-openjdk binwalk tree-sitter duf tokei
)
pacman_customization=(
    arc-gtk-theme bash-completion feh
)
pacman_gnome=(
    gnome-tweaks
)
pacman_music=(
    mpd mpc
)
pacman_fonts=(
    ttf-roboto ttf-roboto-mono ttf-font-awesome ttf-fira-code ttf-fira-sans
    ttf-fira-mono ttf-lato ttf-material-icons ttf-droid cantarell-fonts
    bdf-unifont terminus-font nerd-fonts-terminus noto-fonts
    ttf-nerd-fonts-symbols
)
pacman_lib=(
    libcurl-compat libev libx11 libxkbcommon-x11 gnu-efi-libs
)

#########
#  yay  #
#########

yay_tools=(
    bfs dtrx slack-desktop google-chrome sublime-text-dev bitwise
    zoxide navi-bin neovim-nightly-bin teams teamviewer tio
    cling libtree bear gdu pandoc-bin
)
yay_customization=(
    paper-icon-theme colorpicker
)

#########
#  pip  #
#########

pip_packages=(
    pynvim neovim
)

###############################################################################
#                                   install                                   #
###############################################################################

yay_args="--needed --noconfirm --nocleanmenu --nodiffmenu --noeditmenu"
pacman_args="--needed --noconfirm"

# update current packages
sudo pacman ${pacman_args} -Syyu 1>/dev/null

# for groups we need to install one by one
for group in ${pacman_groups[*]}; do
    sudo pacman -S ${pacman_args} ${group} 1>/dev/null
done

sudo pacman -Sy ${pacman_args}           \
    ${pacman_utils[*]}                   \
    ${pacman_dev[*]}                     \
    ${pacman_tools[*]}                   \
    ${pacman_customization[*]}           \
    ${pacman_gnome[*]}                   \
    ${pacman_lib[*]}                     \
    1>/dev/null

yay -Sy ${yay_args}                      \
    ${yay_tools[*]}                      \
    ${yay_customization[*]}              \
    1>/dev/null

pip2 install --user --upgrade pip
pip3 install --user --upgrade pip
pip2 install --user ${pip_packages[*]} 1>/dev/null
pip3 install --user ${pip_packages[*]} 1>/dev/null

###############################################################################
#                                architecture                                 #
###############################################################################
# ├── devel
# │   ├── personal
# │   └── repos
# │       ├── dev
# │       ├── embedded
# │       ├── tools
# │       └── ui
# ├── .toolchains
# │   └── [version]
# │       ├── aarch32
# │       └── aarch64
# │

mkdir -p "${DIR_PERSONAL}"

mkdir -p "${DIR_REPOS_UI}"
mkdir -p "${DIR_REPOS_DEV}"
mkdir -p "${DIR_REPOS_TOOLS}"
mkdir -p "${DIR_REPOS_EMBEDDED}"

mkdir -p "${DIR_ARM_32_TOOLCHAIN}"
mkdir -p "${DIR_ARM_64_TOOLCHAIN}"

###############################################################################
#                                 toolchains                                  #
###############################################################################

wget -cO- "${URL_ARM_32_TOOLCHAIN_11_2}" | \
    tar xf - -J -C "${DIR_ARM_32_TOOLCHAIN}" --strip-components=1
wget -cO- "${URL_ARM_64_TOOLCHAIN_11_2}" | \
    tar xf - -J -C "${DIR_ARM_64_TOOLCHAIN}" --strip-components=1

###############################################################################
#                                 activation                                  #
###############################################################################

if [[ ! -d "${DIR_DOTFILES}" ]]; then
    git clone --recursive "${REPO_DOTFILES}" "${DIR_DOTFILES}" 1>/dev/null
    cd "${DIR_DOTFILES}" || exit 1

    find * -maxdepth 0 -type d -exec stow --adopt {} \;
    bat cache --build 1>/dev/null
fi

###############################################################################
#                               gnome settings                                #
###############################################################################

sed "s|##HOME##|$HOME|g" .gnome/org.gnome.ini > ${TEMP_GNOME_CONFIG}
dconf load /org/gnome/ < ${TEMP_GNOME_CONFIG}

# dynamically set background/screensaver image
gsettings set org.gnome.desktop.background picture-uri file://${BACKGROUND_IMAGE}
gsettings set org.gnome.desktop.screensaver picture-uri file://${SCREENSAVER_IMAGE}

# disable workspace keybindings
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['']"

# disable top left hot corner
gsettings set org.gnome.desktop.interface enable-hot-corners false

sudo dconf update

rm -f ${TEMP_GNOME_CONFIG}

###############################################################################
#                                  services                                   #
###############################################################################

sudo systemctl enable sshd

sudo systemctl enable docker

sudo systemctl disable bluetooth

grep -q docker /etc/group || sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo usermod -aG uucp ${USER}

###############################################################################
#                               build terminal                                #
###############################################################################

if [[ ! -d "${DIR_REPOS_TOOLS}/tilix" ]]; then
    git clone --recursive "${REPO_TILIX}" "${DIR_REPOS_TOOLS}/tilix" 1>/dev/null
    cd "${DIR_REPOS_TOOLS}/tilix" || exit 1
    dub build --build=release &> /dev/null
    sudo ./install.sh &> /dev/null
    dconf load /com/gexperts/Tilix/ < "${HOME}/.config/tilix/tilix.conf"
else
    echo "${DIR_REPOS_TOOLS}/tilix already exists"
fi

###############################################################################
#                                neovim config                                #
###############################################################################

# nvim -c 'PlugInstall --sync' -c '<\CR>' -c 'qa'

echo "Installation done!"
