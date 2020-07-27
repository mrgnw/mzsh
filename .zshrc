### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Theme
zinit ice pick"async.zsh" src"pure.zsh";
zinit light sindresorhus/pure

# plugins
zinit wait lucid light-mode for \
    b4b4r07/enhancd \
    junegunn/fzf \
    tj/git-extras \
    zdharma/history-search-multi-word \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    zsh-users/zsh-syntax-highlighting

# mrgnw/dotfiles
export Z="$HOME/.zsh"
for f in $Z/**/*.zsh; do
    zinit ice lucid wait"0";
    zinit snippet "$f"
done

