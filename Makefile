SHELL:=/bin/bash

.PHONY: all
all: homebrew_packages vim_plug fish_plugins aws_cli npm_globals

homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

homebrew_packages: homebrew
	brew bundle --file ~/Brewfile

vim_plug:
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

fish_plugins: homebrew
	fish -c 'curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher'
	fish -c 'fisher install ~/.config/fish/fish_plugins'

aws_cli:
	curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
	installer -pkg AWSCLIV2.pkg -target /

npm_globals: homebrew
	npm i -g \
		bunyan \
		typescript \
		typescript-language-server \
		diagnostic-languageserver \
		eslint_d \
		pyright
