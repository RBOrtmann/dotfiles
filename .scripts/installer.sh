# Adapted from https://github.com/OrangeFran/dotfiles/blob/master/install.sh

# Alias to maniuplate dotfiles
dotfiles_alias () {
    alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
}

# Install miscellaneous packages
install_misc () {

    # Install yay, neofetch, lolcat, latte dock
    sudo pacman -S yay neofetch lolcat latte-dock

    # Install packages for transparent menus
    sudo pacman -S appmenu-gtk-module libdbusmenu-glib

    # Install ocs-url
    yay -G ocs-url

    # Get Layan theme for Kvantum and GTK
    yay -G layan-kde-git

}

# Install rust crates
install_rust () {
    # Install rust
    # curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    pacman -S rust

    # Install exa, ripgrep, tldr
    cargo install exa ripgrep tealdeer
}

# Install zsh, oh-my-zsh, powerlevel10k
install_zsh () {
    sudo pacman -S --needed zsh zsh-syntax-highlighting
    ln .zshrc ~
    ln .p10k.zsh ~

    # Oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Download font for and install P10k (to use: set ZSH_THEME="powerlevel10k/powerlevel10k" in .zshrc)
    sudo pacman -S ttf-meslo-nerd-font-powerlevel10k zsh-theme-powerlevel10k-git
}

install_all () {
    dotfiles_alias
    install_zsh
    install_rust
    install_misc
}

help_menu() {

    echo -e "\nPossible arguments:\n"
    echo -e "\t-a | --all"
    echo -e "\t-r | --rust"
    echo -e "\t-m | --misc"
    echo -e "\t-z | --zsh"
    echo -e "\t-h | --help"

}

if [[ $# -eq 0 ]]; then
    help_menu
fi

for p in $@
do
    case $p in
        "-a" | "--all")
            install_all
            ;;
        "-z"| "--zsh")
            install_zsh
            ;;
        "-r"| "--rust")
            install_rust
            ;;
        "-m"| "--misc")
            install_misc
            ;;
        "-h" | "--help")
            help_menu
            ;;
        *)
            echo "No such option: $p"
    esac
done
