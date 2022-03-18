#!/usr/bin/env bash

############################################################
# Build The locate database (/var/db/locate.database)
############################################################

  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist


############################################################
# MacOS System defaults
############################################################

  defaults write com.apple.finder AppleShowAllFiles YES; # show hidden files
  defaults write com.apple.dock persistent-apps -array; # remove icons in Dock
  defaults write com.apple.dock tilesize -int 36; # smaller icon sizes in Dock
  defaults write com.apple.dock autohide -bool true; # turn Dock auto-hidng on
  defaults write com.apple.dock autohide-delay -float 0; # remove Dock show delay
  defaults write com.apple.dock autohide-time-modifier -float 0; # remove Dock show delay
  defaults write com.apple.dock orientation right; # place Dock on the right side of screen
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true; # show all file extensions
  killall Dock 2>/dev/null;
  killall Finder 2>/dev/null;


############################################################
# vim config
############################################################
  echo "Setting up ~/.vimrc...";
  touch ~/.vimrc;
  echo "set number" >> ~/.vimrc;
  echo "set ruler" >> ~/.vimrc;
  echo "set nowrap" >> ~/.vimrc;
  echo "highlight OverLength ctermbg=red ctermfg=white guibg=#592929" >> ~/.vimrc;
  echo "match OverLength /\\%81v.\\+/" >> ~/.vimrc;


############################################################
# install Xcode Command Line Tools
# https://github.com/timsutton/osx-vm-templates/blob/ce8df8a7468faa7c5312444ece1b977c1b2f77a4/scripts/xcode-cli-tools.sh
############################################################

  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l |
    grep -o "Command Line Tools for Xcode-.*" |
    tr -d '\n')
  softwareupdate -i "$PROD" --verbose;


############################################################
# Unattended Homebrew installation
# https://docs.brew.sh/Installation
############################################################

  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


############################################################
# Install Google Chrome browser
# https://formulae.brew.sh/cask/google-chrome
############################################################

  brew install --cask google-chrome


############################################################
# Install git
# https://formulae.brew.sh/formula/git#default
############################################################

  brew install git


############################################################
# Install gh
# https://formulae.brew.sh/formula/gh#default
############################################################

  brew install gh


############################################################
# Install tmux
############################################################
  brew install tmux


############################################################
# Install node
############################################################
  brew install node


############################################################
# Install anaconda
# https://formulae.brew.sh/cask/anaconda
############################################################
  brew install --cask anaconda


############################################################
# Install unity-hub and unity
https://formulae.brew.sh/cask/unity-hub#default
https://formulae.brew.sh/cask/unity#default
############################################################
  brew install --cask unity-hub
  brew install --cask unity


############################################################
# Install visual studio code
https://formulae.brew.sh/cask/visual-studio-code#default
############################################################
  brew install --cask visual-studio-code


############################################################
# TODO: revisit the list below, clean them up one at a time
############################################################
# brew install \
#   boost	\
#   caskroom/cask/brew-cask \
#   cmake \
#   leiningen \
#   mongodb \
#   mysql \
#   nmap \
#   openssl \
#   privoxy \
#   pssh \
#   python \
#   redis \
#   homebrew/versions/swig304 \
#   tor \
# ;
# brew tap caskroom/versions;
# brew cask install \
#   1password \
#   adium \
#   clion-rc-bundled \
#   dropbox \
#   firefox \
#   flash \
#   google-chrome-canary \
#   haskell-platform \
#   java \
#   keka \
#   kindle \
#   macs-fan-control \
#   mactracker \
#   microsoft-office \
#   packer \
#   sequel-pro \
#   skype \
#   silverlight \
#   spectacle \
#   spotify \
#   sublime-text \
#   vagrant \
#   virtualbox \
#   vlc \
#   vmware-fusion \
#   webstorm \
# ;

# git config --global credential.helper osxkeychain; # activate git credentials storage
# git config --global push.default simple; # default Git push behavior is set to `simple`

# echo "Setting up MongoDB...";
# sudo mkdir -p /data/db;
# ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents;
# launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist;

# # install Oracle VM VirtualBox Extension Pack (needed to load OS X on VirtualBox)
# # http://alanthing.com/blog/2013/03/17/virtualbox-extension-pack-with-one-line
# export version=$(/usr/bin/vboxmanage -v) &&
# export var1=$(echo ${version} | cut -d 'r' -f 1) &&
# export var2=$(echo ${version} | cut -d 'r' -f 2) &&
# export file="Oracle_VM_VirtualBox_Extension_Pack-${var1}-${var2}.vbox-extpack" &&
# curl --silent --location http://download.virtualbox.org/virtualbox/${var1}/${file} \
#   -o ~/Downloads/${file} && VBoxManage extpack install ~/Downloads/${file} --replace &&
# rm ~/Downloads/${file} &&
# unset version var1 var2 file;

# vagrant box add jhcook/osx-yosemite-10.10;
