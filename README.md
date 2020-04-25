# dotfiles

A repository for my dotfiles. I use:

- [zsh](zsh.org)
- [oh-my-zsh](https://ohmyz.sh/)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
  - With the recommended MesloLGS NF font
- a .dircolors file to set my terminal output to match the Solarized Dark theme

## .dircolors

I add .dircolors to my home directory and add the following to my .zshrc:

```zsh
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
```

The terminal output should then match the color theme of the terminal assuming it's set to some analogue of Solarized Dark.
