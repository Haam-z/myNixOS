#!/usr/bin/env sh
declare -gx XDG_CONFIG_HOME=~/.config
GIT="git --git-dir=$XDG_CONFIG_HOME/nixos/.git --work-tree=$XDG_CONFIG_HOME/nixos"
DMENU="dmenu -i -l 20"
flake_push(){
    $GIT commit -am "changed configs"
    $GIT push origin master
}
nixos_rebuild(){
    flake_push
    SUDO_ASKPASS=$HOME/dpass sudo -A nixos-rebuild switch --flake github:Haam-z/myNixOS#Nixos
}

home_manager_rebuild(){
    flake_push
     home-manager switch --flake github:Haam-z/myNixOS#haam
}
chose_level(){
    sys_levl=$(printf "nixos\nhome-manager" | $DMENU)
    case $sys_levl in
        nixos)
            nixos_rebuild
            ;;
        home-manager)
            home_manager_rebuild
            ;;
        *)
            chose_level
            ;;
    esac
}
chose_level
