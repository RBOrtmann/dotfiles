# Adapted from https://github.com/OrangeFran/dotfiles/blob/master/install.sh

# Alias to maniuplate dotfiles
dotfiles_alias () {
    alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
}

# Install miscellaneous packages
install_misc () {
    # Install yay, neofetch, lolcat
    sudo pacman -S yay neofetch lolcat
}

# Install rust crates
install_rust () {
    # Install rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # Install exa, ripgrep, tldr
    cargo install exa ripgrep tldr
}

# Install zsh, oh-my-zsh, powerlevel10k
install_zsh () {
    sudo pacman -S --needed zsh zsh-syntax-highlighting
    ln .zshrc ~
    ln .p10k.zsh ~

    # Oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Powerlevel 10k (to use: set ZSH_THEME="powerlevel10k/powerlevel10k" in .zshrc)
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
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

for p in $@
do
    # find the 
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
