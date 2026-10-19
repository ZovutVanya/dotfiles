# ==============================================================================
# 0. TMUX AUTO-START (MUST BE BEFORE P10K)
# ==============================================================================
if [[ -n "$SSH_CONNECTION" && -z "$TMUX" && $- == *i* && -z "$NO_TMUX" ]]; then
  exec tmux new-session -A -s bruh
fi

# ==============================================================================
# 1. EARLY INIT
# ==============================================================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================================================================
# 2. OH MY ZSH CONFIGURATION
# ==============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
zstyle ':omz:update' mode auto
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  # fast-syntax-highlighting
  colored-man-pages
  command-not-found
  zsh-shift-select
  zsh-autocomplete
)

source "$ZSH/oh-my-zsh.sh"

# ==============================================================================
# 3. OS-SPECIFIC CONFIGURATIONS
# ==============================================================================

if [[ "$OSTYPE" == darwin* ]]; then
  # --- macOS (Personal) ---

  # Load Apple Keychain
  ssh-add --apple-load-keychain -q

  # SICP
  export PLTCOLLECTS="$PLTCOLLECTS:~/Desktop/SICP/"

  # PostgreSQL
  export PATH="/Library/PostgreSQL/18/bin:$PATH"

  # GNU utils instead of BSD (Homebrew)
  BREW_BIN="/usr/local/bin/brew"
  if [ -f "/opt/homebrew/bin/brew" ]; then
    BREW_BIN="/opt/homebrew/bin/brew"
  fi
  if type "${BREW_BIN}" &>/dev/null; then
    export BREW_PREFIX="$("${BREW_BIN}" --prefix)"
    for bindir in "${BREW_PREFIX}/opt/"*"/libexec/gnubin"; do export PATH=$bindir:$PATH; done
    for mandir in "${BREW_PREFIX}/opt/"*"/libexec/gnuman"; do export MANPATH=$mandir:$MANPATH; done
    for mandir in "${BREW_PREFIX}/opt/"*"/share/man/man1"; do export MANPATH=$mandir:$MANPATH; done
  fi

  # Cask upgrade only works on macOS
  alias brewup='brew update && brew upgrade && brew upgrade --cask && brew cleanup'

  # SSH without TMUX
  ssh_plain() {
    ssh "$@" -t 'NO_TMUX=1 exec $SHELL -l'
  }

elif [[ "$OSTYPE" == linux-gnu* ]]; then
  # --- Linux (Server) ---

  # Linuxbrew setup
  if [ -d "/home/linuxbrew/.linuxbrew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  fi

  # Linux specific SSH Auth Sock (macOS handles this automatically via LaunchAgent)
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

  alias brewup='brew update && brew upgrade && brew cleanup'
fi

# ==============================================================================
# 4. UNIVERSAL EXPORTS & PATHS
# ==============================================================================
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/shell-scripts:$PATH"
export PATH="$HOME/go/bin:$PATH"

export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="$(which nvim)"
export GPG_TTY=$(tty)

# ==============================================================================
# 5. UNIVERSAL ALIASES & FUNCTIONS
# ==============================================================================
alias zshrc="nvim ~/.zshrc || vim ~/.zshrc"
alias please='sudo "$SHELL" -c "$(fc -ln -1)"'
alias grep='grep --color=auto'
alias py="python3"
alias ff='fastfetch --key-type icon --key-padding-left 1 --separator "  "'
alias lg="lazygit"

# eza aliases
export EZA_COLORS="da=35"
alias ls='eza'
alias lsc='eza -lahsmodified'
alias lsl='eza -lh'
alias lsa='eza -lar'
alias lst='eza -lhT'
alias lstd='eza -lhTD'

# git
git() {
  if [[ $1 == "init" ]]; then
    printf "**/.DS_Store\n**/Icon?\n" >>".gitignore"
    command git init "${@:2}"
  else
    command git "$@"
  fi
}
alias groot='cd $(git rev-parse --show-toplevel)'
alias groot..='cd $(git rev-parse --show-toplevel) && cd ..'

# utils
cdir() { mkdir -p -- "$1" && cd -- "$1" || return; }
uvrun() { uv run "$@"; }
alias uvact='source $(git rev-parse --show-toplevel)/.venv/bin/activate'

# Yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# ==============================================================================
# 6. TOOL INITIALIZATIONS (Safeguarded)
# ==============================================================================
# Edit command buffer
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

# Default Python environment
if [ -d "$HOME/venvs/default" ]; then
  source "$HOME/venvs/default/bin/activate"
fi

# Zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# Atuin
if command -v atuin &>/dev/null; then
  eval "$(atuin init zsh)"
fi

# UV
if command -v uv &>/dev/null; then
  eval "$(uv generate-shell-completion zsh)"
  eval "$(uvx --generate-shell-completion zsh)"
fi

# P10K Configure
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
