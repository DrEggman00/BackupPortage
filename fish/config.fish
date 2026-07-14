# Commands to run in interactive sessions can go here
if status is-interactive
    # No greeting
    set fish_greeting

    # Edite este arquivo com: nano ~/.config/fish/config.fish
    alias up="sudo emerge --verbose --ask --newuse --changed-use --deep --update --autounmask-write=y @world"
    alias i="sudo emerge --verbose --ask"
    alias ia="sudo emerge --verbose --ask --autounmask-write=y"
    alias r="sudo emerge --unmerge --ask"
    alias depclean="sudo emerge --depclean --ask"
    alias sync="sudo emerge-webrsync && sudo emerge --sync"
    alias makee="sudo nano /etc/portage/make.conf"
    alias usedir="cd /etc/portage/package.use/"
    alias wordir="cd /etc/portage/package.acce*words/"
    alias portage="cd /etc/portage"
    alias mask="cd /etc/portage/package.mask/"
    alias unmask="sudo vim /etc/portage/package.unmask"
    alias news="eselect news read"
    alias expresso="sudo MAKEOPTS='-j21 -l21' emerge --quiet"
    alias s="emerge -s"
    alias expup="sudo MAKEOPTS='-j21 -l21' emerge --quiet --newuse --changed-use --deep --update --autounmask-write=y @world"
    alias soft="sudo MAKEOPTS='-j2 -l2' emerge"
    alias softup="sudo MAKEOPTS='-j2 -l2' emerge -auvDNn @world"
    alias med="sudo MAKEOPTS='-j12 -l12'"
    alias upm="emerge -uvDNn @world"

    # --- Utilidades ---
    alias power="sudo cpupower frequency-set -g powersave"
    alias per="sudo cpupower frequency-set -g performance"
    alias c="clear"
    alias CLEAR="clear"
    alias code="codium"
    alias f="fastfetch"
    alias n="nvim"
    # --- Monitoramento/Hardware ---
    alias timepack="genlop -t"
    alias memory="fastfetch | grep GiB"
    alias battery="fastfetch | grep Battery"
    alias os="fastfetch | grep OS"
    alias timeover="watch -cn 0.1 genlop -ci"

    # --- Configurações Específicas ---
    alias update-grub="sudo nano /etc/default/grub && sudo grub-mkconfig -o /boot/grub/grub.cfg"

    # --- Aliases para o próprio Fish (Substitutos do ZSH) ---
    alias sf="source ~/.config/fish/config.fish"
    alias fs="vim ~/.config/fish/config.fish"

    # Use starship
    function starship_transient_prompt_func
        starship module character
    end
    if test "$TERM" != linux
        starship init fish | source
        enable_transience
    end

    # Colors
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Aliases
    # kitty doesn't clear properly so we need to do this weird printing
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias pamcan pacman
    alias q 'qs -c ii'
    if test "$TERM" != linux
        alias ls 'eza --icons'
    end
    if test "$TERM" = xterm-kitty
        alias ssh 'kitten ssh'
    end

end
