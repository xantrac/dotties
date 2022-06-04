# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

. $(brew --prefix asdf)/libexec/asdf.sh
autoload -Uz compinit && compinit

alias gp="git pull"
alias src="source ~/.zshrc"
alias nv="nvim"
alias zr="nv ~/.zshrc"
alias vr="nv ~/.config/nvim/init.vim"
alias ghw="gh repo view --web"
alias on="cd ~/src/maitre_d"
alias onprod="heroku run iex -S mix  -a ordernerd"
alias pm="cd ~/src/popmenu"
alias g="git"
alias gco="git checkout"
alias be="bundle exec"
alias rspec="be rspec"
alias ts="cd ~/projects/timeslicer"
alias mr="cd ~/projects/moonrise"
export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_CONFIGURE_OPTIONS="--disable-debug --disable-hipe --without-javac --with-ssl=$(brew --prefix openssl@1.1)"
export CFLAGS="-O2 -g -fno-stack-check"
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*}"'

export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
