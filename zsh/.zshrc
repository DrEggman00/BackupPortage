# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="smt"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Alias
## EMERGES
alias upgrade-arsenal="bash /home/dr/scripts/upgrade-arsenal.sh"
#alias up="sudo pacman -Syyuu"
alias fabricate="bash /home/dr/scripts/fabricate.sh" 
#alias i="sudo pacman -S"
#alias terminate="sudo emerge --unmerge --ask"
# Em vez de apenas abrir o vim/nano, avisa o que está fazendo
alias makee="echo 'ACESSANDO PROTOCOLO DE FABRICAÇÃO...' && sudo nano /etc/portage/make.conf"
alias unmask="echo 'REMOVENDO TRAVA DE SEGURANÇA DE ARMAMENTO...' && sudo vim /etc/portage/package.unmask"
alias terminate="bash /home/dr/scripts/terminate.sh"
alias sweep-debris="sudo emerge --depclean --ask --quiet"
alias recon="bash /home/dr/scripts/satellite_sync.sh"
#alias makee="sudo nano /etc/portage/make.conf"
alias usedir="cd /etc/portage/package.use/"
alias wordir="cd /etc/portage/package.acce*words/"
alias portage="cd /etc/portage"
alias mask="cd /etc/portage/package.mask/"
#alias unmask="sudo vim /etc/portage/package.unmask"
alias news="eselect news read"
alias search="emerge -s"
alias purge-weakness="echo -e '\e[1;31m[!] INICIANDO INCINERAÇÃO DE DADOS INÚTEIS...\e[0m' && sudo emerge -q --depclean && sudo eclean-dist --deep && echo -e '\e[1;32m[*] O IMPÉRIO ESTÁ OTIMIZADO.\e[0m'"

alias check-intruders="echo -e '${RED}[!] ESCANEANDO PERÍMETRO...${NC}' && ss -tunlp"


## COMMANDS
alias c="clear"
alias sz="source ~/.zshrc"
alias zs="vim ~/.zshrc"
alias code="codium"
alias timepack="genlop -t"
alias fuel-level="fastfetch | grep GiB"
alias core-stability="fastfetch | grep Battery"
alias firmware-version="fastfetch | grep OS"
alias eta-impact="bash /home/dr/scripts/impact_monitor.sh"
alias CLEAR="clear"
alias c="clear"
alias update-grub="sudo vim /etc/default/grub && sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias f="fastfetch"
alias blackbox="tail -f /var/log/messages"
alias reboot-core="sudo reboot"
alias blackout="sudo poweroff"
alias fetch="wget"
# Diagnóstico de Hardware Estilo CoD/Eggman
# Agora o alias apenas aponta para o seu arquivo de configuração
alias status-mecha="fastfetch --config ~/.config/fastfetch/eggman.jsonc"
alias scan-hardware="btop"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# O Manual formatado
alias ops="bash ~/scripts/manual-ops.sh"
alias manual="ops"

# Comando para ver todos os aliases brutos (estilo 'caixa preta')
alias arsenal="alias | grep -E 'emerge|fastfetch|genlop' | column -t -s '='"


# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
WINE=/home/dr/.config/heroic/tools/wine/Wine-GE-latest/bin/
export XILINX_VIVADO=$HOME/Xilinx/2025.2/Vivado
export LD_LIBRARY_PATH=$XILINX_VIVADO/lib/lnx64.o/Rhel/10:$LD_LIBRARY_PATH
export PATH="/usr/lib/ccache/bin${PATH:+:}${PATH}"
export CCACHE_DIR="/var/tmp/ccache"
# Exemplo de Prompt Estilo Militar/CoD
export PS1="%F{red}[%*]%f %F{yellow}RANK:GENERAL%f %F{red}>>%f %F{white}%~%f $ "
#export LD_LIBRARY_PATH=$HOME/build-compat/vivado/lib/lnx64.o/Rhel/10
# No final do seu ~/.zshrc
echo -e "\e[1;31m"
echo "  [SISTEMA DE DEFESA EGGMAN ATIVO]  "
echo "  STATUS: PRONTO PARA CONQUISTA     "
echo -e "\e[0m"
status-mecha  # Mostra as specs sem o logo padrão



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
