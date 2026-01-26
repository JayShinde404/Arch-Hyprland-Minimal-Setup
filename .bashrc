#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#---------------------------------------------------------------------------

##############################
##### OLLAMA ENVIRONMENT #####
##############################

#Using Vulkan(RADEON) framework for Ollama
export OLLAMA_VULKAN=1

#Use the 1st GPU found(iGPU Radeon 680m)
export GGML_VK_VISUAL_DEVICES=0

#---------------------------------------------------------------------------

###################
##### ALIASES #####
###################

#Pacman
alias i='sudo pacman -S'
alias r='sudo pacman -R'
alias rns='sudo pacman -Rns'
alias u='sudo pacman -Sy'
alias U='sudo pacman -Syu'
alias s='sudo pacman -Ss'
alias icc='sudo pacman -Scc'
alias pkglist='sudo pacman -Qqe'

#Paru(AUR Helper)
alias pi='paru -S'
alias ps='paru -Ss'
alias pr='paru -R'
alias pu='paru -Sy'
alias pU='paru -Syu'
alias prns='paru -Rns'
alias pcc='paru -Scc'

#System
alias s='sudo'
alias status='sudo systemctl status'
alias enable='sudo systemctl enable'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias disable='sudo systemctl disable'

#Utility
alias v='nvim'
alias sv='sudo nvim'
alias f='yazi'
alias ls='exa -a'
alias du='dust'
alias gparted='sudo gparted & disown'
alias timeshift-gui='sudo timeshift-gtk & disown'
alias hypr='start-hyprland'
alias update-grub='sudo grub-mkconfig -o /boot/grub.cfg'

#SSH
alias archwiki='w3m wiki.archlinu/home/jay/Downloads/rebornos_iso-2025.07.09-x86_64.isox.org'
alias ssh-connect-tab='ssh -tt -p 8022 u0_a158@192.168.1.83 bash'
alias sshfs-connect-tab='sshfs -p 8022 u0_158@192.168.1.83:/storage/emulated/0/tablet-nas ~/tablet-nas'

#Config
alias ebash='nvim ~/.bashrc'
alias ehypr='nvim ~/.config/hypr/hyprland.conf'
alias ekitty='nvim ~/.config/kitty/kitty.conf'
alias mime='update-desktop-database ~/.local/share/applications'

#Misc
alias show='fastfetch'
alias f='yazi'

## TO GET FZF ADDONS, SCROLL TO THE BOTTOM OF THE FUNCTIONS SECTION
#alias vf="nvim $(fzf --preview 'bat --style=numbers --color=always {}')"
#alias svf='sudo nvim $(fzf)'
#alias mf='micro $(fzf)'

#---------------------------------------------------------------------------

#####################
##### FUNCTIONS #####
#####################
#Bash Functions to be sourced into bashrc

# Connect to SSH server
# Use: ssh-connect [hostname] [IP-Address]
ssh-connect() {
  local server="$1" # ssh server hostname
  local ip="$2"     # ssh server IP-Address

  if [[ $# -ne 2 ]]; then
    echo "Usage: ssh-connect [hostname] [ip]"
    return 1
  fi

  ssh -tt -p 8022 "$server"@"$ip"
}

# Create Mounted Virtual Directory/Disk with SSHFS
# Use: sshfs-connect [hostname] [IP-Address] [remote_path] [local_path]
sshfs-connect() {
  local server="$1"
  local ip="$2"
  local remotedir="$3"
  local localdir="$4"

  if [[ $# -ne 4 ]]; then
    echo "Usage: sshfs-connect [hostname] [IP-Address] [remote_path] [local_path]"
    return 1
  fi

  if [[ ! -d "$localdir" ]]; then
    if mkdir -p "$localdir"; then
      echo "Creating Mount Directory.......Success!"
    else
      echo "Creating Mount Directory.......Failed!"
    fi
  else
    echo "Directory Already Exists.......Proceeding Mounting Process......."
  fi

  sshfs -p 8022 "$server"@"$ip":"$remotedir" "$localdir"
}

# Autocompletion
if [[ ! -v BASH_COMPLETION_VERSINFO && -f /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi

# Ensure command hashing is off for mise
set +h

# Open selected file in nvim with a preview
vf() {
  local file=$(fzf --preview 'bat --color=always {}')
  [ -n "$file" ] && nvim "$file"
}

# Open selected file with sudo privleges in nvim with a preview
svf() {
  local file=$(fzf --preview 'bat --color=always {}')
  [ -n "$file" ] && sudo nvim "$file"
}

# Open selected file in micro with a preview
mf() {
  local file=$(fzf --preview 'bat --color=always {}')
  [ -n "$file" ] && micro "$file"
}

#--------------------------------------------------------------------------

#######################
##### BASH PROMPT #####
#######################
#Bash Prompt for Aesthetics

# Function to get battery percentage
battery() {
  cat /sys/class/power_supply/BAT0/capacity 2>/dev/null
}

# Colors
WHITE='\[\e[0m\]'
GRAY='\[\e[1;90m\]'
GREEN='\[\e[1;32m\]'

#Prompt for:╭─  Time:hh:mm Battery:xx% [~]
#	          ╰─➤
PS1="${GRAY}╭─ TIME:${WHITE}\A ${GRAY}BATTERY:${WHITE}$(battery)%  ${GRAY}{\w}
${GRAY}╰─➤ ${WHITE}"
