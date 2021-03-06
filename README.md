# dotfiles

A repository for my dotfiles. I use:

- [zsh](zsh.org)
- [oh-my-zsh](https://ohmyz.sh/)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
  - With the recommended MesloLGS NF font
- a .dircolors file to set my terminal output to match the Solarized Dark theme

## Packages

- [exa](https://github.com/ogham/exa)
- [thefuck](https://github.com/nvbn/thefuck)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [neofetch](https://github.com/dylanaraps/neofetch)
- [lolcat](https://github.com/busyloop/lolcat) (i'm sorry)
- [tldr](https://github.com/tldr-pages/tldr)

## Dependencies

- [rust](https://www.rust-lang.org/tools/install) (for the exa package)
- [python-dev](https://packages.debian.org/buster/python-dev) (for the thefuck package)
  - Name depends on distro -- under Fedora it's called "python-devel"
- [git](https://git-scm.com/download/linux) (why wouldn't it be installed by default, Fedora???)

## .dircolors

I add .dircolors to my home directory and add the following to my .zshrc:

```zsh
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
```

The terminal output should then match the color theme of the terminal assuming it's set to some analogue of Solarized Dark.
