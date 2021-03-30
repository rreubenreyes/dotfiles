# install.sh calls this file

echo "installing fisher"
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

echo "installing plugins from ~/.config/fish/fish_plugins"
fisher install ~/.config/fish/fish_plugins
