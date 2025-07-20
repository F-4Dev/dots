export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export EDITOR='micro'
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 30   # 30 days

# plugins
ZSH_COLORIZE_TOOL=chroma
ZSH_COLORIZE_STYLE="github"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
. ~/z.sh

plugins=(
        git
        colorize
        thefuck
        zsh-autosuggestions
		fast-syntax-highlighting
#        bun
#        deno
#        docker
#        docker-compose
#        pip
)

# imports
source $ZSH/oh-my-zsh.sh

# [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
# source /usr/share/nvm/nvm.sh
# source /usr/share/nvm/bash_completion
# source /usr/share/nvm/install-nvm-exec

# aliase
alias nano=micro
alias ping=mtr
alias ls="lsd"
alias nt="hyprctl dispatch exec $1"
alias pacman="sudo pacman"
alias ripcd="abcde"
alias lunix="ssh f4@192.168.178.48"
alias hypr="cd ~/.config/hypr && code"
alias 2png="wine ~/custom-installations/jpeg2png_1.02_x64.exe -i 1000 $1"
alias desktop="ls /etc/share/applications | gum"
# alias updateRpiIp='(){ echo "Host rpi\n  Hostname $1\n  Port 22\n  User f4\n  IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config}'
alias code="codium"
alias cls="clear"

alias hpset='hyprpanel toggleWindow settings-dialog'

alias zs="nano ~/.zshrc && rezsh"

alias ytdl="/home/f4/.local/bin/yt-dlp"
alias yt-dlp="ytdl"

alias upgrade='yay -Syu --noconfirm --devel --rebuildtree --answerclean A --answerdiff N --answeredit N --answerupgrade A --noremovemake --cleanafter'

alias mysql="/opt/lampp/bin/mysql -u"


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/f4/.dart-cli-completion/zsh-config.zsh ]] && . /home/f4/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# Created by `pipx` on 2025-03-28 15:08:42
export PATH="$PATH:/home/f4/.local/bin"
