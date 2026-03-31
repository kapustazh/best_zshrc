# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Powerlevel10k theme
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# CUSTOM SCRIPTS AND FUNCTIONS

# 1. Rapid compilation and execution of a C file with strict flags
# Usage: cr main.c
cr() {
    local base="${1%.*}"
    gcc -Wall -Wextra -Werror "$1" -o "$base" && "./$base"
}

# 2. Wrapper for Valgrind (passes all arguments to the program)
# Usage: vg ./minishell arg1 arg2
vg() {
    valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes "$@"
}

# ALIASES

# Git
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gst="git status"
alias gp="git push"
alias gr="git pull --rebase"
alias gl="git log --oneline --graph --decorate"

# Make
alias all="make all"
alias clean="make clean"
alias fclean="make fclean"
alias re="make re"

# Python
alias mp="mypy . --warn-return-any --warn-unused-ignores --ignore-missing-imports --disallow-untyped-defs --check-untyped-defs"

# PLUGIN INITIALIZATION & DEPENDENCIES

# 1. zoxide (Smart navigation)
# Installation: curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# 2. fzf (Fuzzy finder)
# Installation: git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
if [[ -f "$HOME/.fzf.zsh" ]]; then
    source "$HOME/.fzf.zsh"
fi

# 3. zsh-autosuggestions
# Installation: git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
if [[ -r "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
  source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# 4. zsh-syntax-highlighting (Must strictly be the last plugin loaded)
# Installation: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
if [[ -f "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi