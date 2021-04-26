# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/turtle/.zshrc'

fpath+=~/.zfunc

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors

for color in red green yellow blue magenta cyan black white; do
    eval $color='%{$fg_no_bold[${color}]%}'
done

reset="%{$reset_color%}"

if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    host="${blue}%m // "
else
    unset host
fi

if [ "$EUID" -eq 0 ]; then
    dir_color="${red}"
else
    dir_color="${cyan}"
fi

PROMPT="
${host}${dir_color}%2~ ${white}\$${reset} "

case $TERM in
    xterm*|rxvt*|screen*)
        precmd() { print -Pn "\e]0;%n @ %~\a" }
        preexec() { print -Pn "\e]0;$1\a" }
        ;;
esac

kitty + complete setup zsh | source /dev/stdin
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

export EDITOR=vim

alias ls="ls --color=auto"

mu() {
    du -h -d 1 | sort -k 1 -h -r
}

github_ssh() {
    eval "$(ssh-agent -s)"
    ssh-add "$HOME/.ssh/github_rsa"
}

wrapper_github_ssh() {
    echo ""
    github_ssh
    echo ""
}

gitpush() {
    git push || wrapper_github_ssh && git push
}

copyfile() {
    cat "$1" | xclip -selection clipboard
}
