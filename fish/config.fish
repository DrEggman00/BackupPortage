# Commands to run in interactive sessions can go here
if status is-interactive
    # No greeting
    set fish_greeting

    # Use starship
    function starship_transient_prompt_func
        starship module character
    end
    if test "$TERM" != linux
        starship init fish | source
        enable_transience
    end

    # Colors
    #if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    #    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    #end

    # Aliases
    # kitty doesn't clear properly so we need to do this weird printing
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    #alias i "sudo nano /etc/nixos/modules/packages.nix && sudo nixos-rebuild switch"
    #alias nixos "cd /etc/nixos/"
    #alias makee "sudo nano /etc/nixos/configuration.nix"
    alias cfish "nvim ~/.config/fish/config.fish"
    alias ckitty "nvim ~/.config/kitty/kitty.conf"
    alias c clear

    # Comandos Portage

    alias sy "sudo emerge --sync"
    alias uprev "sudo emerge @preserved-rebuild -a"
    alias uq "sudo revdep-rebuild"
    alias uprevq "sudo emerge @preserved-rebuild -aq"
    alias eu "sudo etc-update"
    alias dis "sudo dispatch-conf"
    alias depclean "sudo emerge --depclean -aq"
    alias p "emerge -pv"

    # Vivado
    set -gx _JAVA_OPTIONS '-Dsun.java2d.uiScale=2.0'
    # Diretórios Portage
    alias portage "cd /etc/portage"
    alias usedir "cd /etc/portage/package.use"
    alias wordir "cd /etc/portage/package.accept_keywords/"
    alias makee "sudo nano /etc/portage/make.conf"

    alias i "sudo emerge"
    alias ia "sudo emerge --ask"
    alias iaq "sudo emerge -aq"
    alias r "sudo emerge --unmerge"
    alias s "emerge -s"
    alias upa "sudo emerge --update --deep --newuse --with-bdeps=y --changed-deps @system @world -av"
    alias up "sudo emerge --update --deep --newuse --with-bdeps=y --changed-deps @system @world -q"
    # Comandos Extras

    alias timepack "genlop -t"
    alias timeclove "sudo timeclover"
    alias update-grub "sudo nano /etc/default/grub && sudo grub-mkconfig -o /boot/grub/grub.cfg"
    # Flatpak

    set -q XDG_DATA_DIRS; or set -gx XDG_DATA_DIRS /usr/local/share:/usr/share
    if not string match -q "*$HOME/.local/share/flatpak/exports/share*" $XDG_DATA_DIRS
        set -gx XDG_DATA_DIRS "*$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
    end

    if test "$TERM" != linux
        alias ls 'eza --icons=auto'
    end
    if test "$TERM" = xterm-kitty
        alias ssh 'kitten ssh'
    end
end
