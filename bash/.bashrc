# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for bash_sh in ${HOME}/.bashrc.d/*.bashrc.sh; do
    if [[ ${__bashrc_bench} ]]; then
		TIMEFORMAT="${bash_sh}: %R"
		time source "${bash_sh}"
		unset TIMEFORMAT
	else
        [ -f ${bash_sh} ] && source "${bash_sh}"
	fi
done

# extra unicode char
# ❯❯ ›› 〉〉ᐳᐳ ❭❭ >> ≫  » >>

