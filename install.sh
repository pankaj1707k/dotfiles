#!/bin/bash

#####################################
# Base installation for all systems #
#####################################

PS3='Select the type of system (may be a derivative of the listed distro): '

select opt in debian fedora; do
    case $opt in
        debian)
            PACKAGE_MANAGER='apt'
            break
            ;;
        fedora)
            PACKAGE_MANAGER='dnf'
            break
            ;;
        *)
            echo 'System config not available'
            ;;
    esac
done

# run basic updates and installation
sudo $PACKAGE_MANAGER update -y

if [[ $PACKAGE_MANAGER == 'apt' ]]; then
    sudo add-apt-repository ppa:git-core/ppa universe multiverse restricted
    sudo apt update
    sudo apt upgrade -y
fi

sudo $PACKAGE_MANAGER install -y curl wget git tldr zip jq vim

echo 'Setting up dotfiles...'
git clone https://github.com/pankaj1707k/dotfiles.git $HOME/dotfiles
DOTS='$HOME/dotfiles'
cat $DOTS/bashrc > $HOME/.bashrc
cat $DOTS/aliases > $HOME/.aliases
cat $DOTS/hushlogin > $HOME/.hushlogin
echo 'Copied bashrc, aliases and hushlogin'

echo 'Setting up git...'
cat $DOTS/gitconfig > $HOME/.gitconfig
read -p 'Enter github user name: ' gh_username
read -p 'Enter github personal access token: ' gh_token
echo 'machine github.com login $gh_username password $gh_token' >> $HOME/.netrc
echo 'Done. Import your gpg private key OR disable commit signing!!'

mkdir -p $HOME/.config
mkdir -p $HOME/tmp
CONFIG='$HOME/.config'
TMP='$HOME/tmp'

PS3='Select prompt: '

select opt in starship custom; do
    case $opt in
        starship)
            curl -sS https://starship.rs/install.sh | sh
            cp $DOTS/starship.toml $CONFIG/
            echo 'eval "$(starship init bash)"' >> $HOME/.bashrc
            break
            ;;
        custom)
            cat $DOTS/bash_custom > $HOME/.bash_prompt
            echo 'source $HOME/.bash_prompt' >> $HOME/.bashrc
            break
            ;;
        *)
            echo 'Invalid option'
            ;;
    esac
done

PS3='Neovim: User or System level installation? '
select opt in user system; do
    case $opt in
        user)
            target_dir='$HOME/.local'
            break
            ;;
        system)
            target_dir='/opt'
            break
            ;;
        *)
            echo 'Invalid option'
            ;;
    esac
done

if [[ ! -e $HOME/.local ]]; then
    mkdir $HOME/.local
fi

echo 'Installing and setting up neovim...'
cd $TMP
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C $target_dir -xzf nvim-linux64.tar.gz
echo 'export PATH="$PATH:$target_dir/nvim-linux64/bin"' >> $HOME/.bashrc
cp -r $DOTS/nvim $CONFIG/

read -p 'Do you want to continue setup for Graphical system? (y/n) ' resp
if [[ resp == 'n' ]]; then
    rm -rf $TMP
    exit
fi

##############################################
# Do the following only on GUI installations #
##############################################

echo 'Installing kitty terminal...'
sudo $PACKAGE_MANAGER install -y kitty
echo 'Setting up kitty...'
mkdir -p $CONFIG/kitty
cp $DOTS/kitty.conf $CONFIG/kitty/


echo 'Installing FiraCode nerd font (system-wide)...'
cd $TMP
curl -sL 'https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest' -o nf
curl -sL $(cat nf | jq '.assets[] | select(.name == "FiraCode.zip") | .browser_download_url') -o FiraCode.zip
unzip FiraCode.zip
sudo mkdir /usr/share/fonts/FiraCode
sudo cp FiraCodeNerdFont-*.ttf /usr/share/fonts/FiraCode/
cd $HOME && rm -rf $TMP/*


echo 'Installing JetBrains Mono font (System-wide)...'
if [[  $PACKAGE_MANAGER == 'dnf' ]]; then
    sudo dnf install -y jetbrains-mono-fonts
else
    cd $TMP
    curl -sL 'https://api.github.com/repos/JetBrains/JetBrainsMono/releases/latest' -o jb
    curl -sL $(cat jb | jq '.assets[0].browser_download_url') -o jbfonts.zip
    unzip jbfonts.zip
    sudo mkdir -p /usr/share/fonts/jetbrains-mono
    sudo cp $TMP/fonts/ttf/JetBrainsMono-*.ttf /usr/share/fonts/jetbrains-mono/
    rm -r $TMP/*
fi


echo 'Installing Inter font (system-wide)...'
if [[ $PACKAGE_MANAGER == 'dnf' ]]; then
    sudo dnf install -y rsms-inter-fonts
else
    sudo apt install -y fonts-inter
fi


echo 'Copying fontconfig...'
mkdir -p $CONFIG/fontconfig
cp $DOTS/fonts.conf $CONFIG/fontconfig/

echo 'Cleanup...'
rm -rf $TMP
