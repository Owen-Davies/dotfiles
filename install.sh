#################################################################
# Install Sudo
su -c "apt-get install -y sudo; /usr/sbin/usermod -a -G sudo ${USER}; su - ${USER}; . ~/source/dotfiles/install.sh"

echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections
export DEBIAN_FRONTEND=noninteractive

#################################################################
# Install some basics before we get started
sudo apt-get update; sudo apt-get install -y vim tmux xinit git build-essential wget curl ranger htop conky gnupg2

# set vim as default git editor
git config --global core.editor "vim"

sudo update-alternatives --set editor /usr/bin/vim.basic


sudo apt-get install -y libx11-dev libxft-dev libxinerama-dev
sudo apt-get install libxrandr-dev -y


#################################################################
# Install Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y
sudo apt-get install libasound2 -y


#################################################################
# Install firefox
echo "deb http://ftp.us.debian.org/debian/ unstable main contrib non-free" | sudo tee -a /etc/apt/sources.list

echo "Package: *" | sudo tee -a /etc/apt/preferences
echo "Pin: release a=stable" | sudo tee -a /etc/apt/preferences
echo "Pin-Priority: 900" | sudo tee -a /etc/apt/preferences
echo "" | sudo tee -a /etc/apt/preferences
echo "Package: *" | sudo tee -a /etc/apt/preferences
echo "Pin: release a=unstable" | sudo tee -a /etc/apt/preferences
echo "Pin-Priority: 10" | sudo tee -a /etc/apt/preferences

sudo apt-get update
sudo apt-get install -t unstable firefox -y 


#################################################################
# Install pass for password management
sudo apt-get install pass -y


#################################################################
# Install email (neomutt)
sudo apt-get install neomutt isync msmtp -y


#################################################################
# Install remmina for RDP management

# the following line has been replaced by the second line... does it work?
#echo 'deb https://ftp.debian.org/debian stretch-backports main' | sudo tee --append /etc/apt/sources.list.d/stretch-backports.list >> /dev/null
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y

sudo apt update
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret remmina-plugin-spice -y


#################################################################
# Install Nextcloud for cloud storage
sudo apt-get install software-properties-common -y
sudo touch /etc/apt/sources.list.d/nextcloud-client.list

echo "deb http://ppa.launchpad.net/nextcloud-devs/client/ubuntu bionic main" | sudo tee -a /etc/apt/sources.list.d/nextcloud-client.list
echo "deb-src http://ppa.launchpad.net/nextcloud-devs/client/ubuntu bionic main" | sudo tee -a /etc/apt/sources.list.d/nextcloud-client.list

sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com AD3DD469

sudo apt-get update
sudo apt install nextcloud-client -y


#################################################################
# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


#################################################################
# Create symlinks for config files
ln -s ~/source/dotfiles/.vimrc ~/.vimrc
ln -s ~/source/dotfiles/.xinitrc ~/.xinitrc


#################################################################
# Install libreoffice
sudo add-apt-repository ppa:libreoffice/ppa -y
sudo apt-get update
sudo apt-get install libreoffice -y


#################################################################
# Install docker

## Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y ca-certificates software-properties-common

## Add dockers office GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

## Add repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" -y

## Update
sudo apt-get update

## Install Docker CE
sudo apt-get install docker-ce -y

## Add current user to be able to run docker as that user
sudo usermod -aG docker $(whoami)

## To apply the new group membership, log out of the server and back in, or type the following:
#su - ${USER}

## Install docker-compose
sudo apt-get install docker-compose -y


#################################################################
# Install Azure CLI

## Modify your source list
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

## Get the Microsoft signing key
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

## Install the CLI
sudo apt-get update && sudo apt-get install azure-cli -y


#################################################################
# Install todo.txt
git clone https://github.com/todotxt/todo.txt-cli ~/source/todo.txt-cli
sudo make -C ~/source/todo.txt-cli/ install

#################################################################
# Install bm for bookmarks management
## Clone bm repo
git clone https://github.com/tj/bm.git ~/source/bm

## Install bm dependencies
sudo apt-get install cutycapt xsel -y

cd ~/source/bm/
sudo make -C ~/source/bm/ install


#################################################################
# Install dwm
git clone https://github.com/owen-davies/dwm ~/source/dwm
sudo make -C ~/source/dwm/ install

#################################################################
# Install st
#git clone https://github.com/owen-davies/
git clone https://git.suckless.org/st ~/source/st
sudo make -C ~/source/st/ install

#################################################################
# Install dmenu
#git clone https://github.com/owen-davies/
git clone https://git.suckless.org/dmenu ~/source/dmenu
sudo make -C ~/source/dmenu/ install

#################################################################
# Install slstatus
git clone https://git.suckless.org/slstatus/ ~/source/slstatus
sudo make -C ~/source/slstatus/ install

#################################################################
# Install slock
git clone https://git.suckless.org/slock/ ~/source/slock
sudo make -C ~/source/slock/ install

## Install xautolock
sudo apt-get install xautolock -y

#################################################################
# Install menu-calc

## Install dependencies
sudo apt-get install bc xclip -y

## Get repository
git clone https://github.com/sumnerevans/menu-calc ~/source/menu-calc
sudo make -C ~/source/bm/ install


#################################################################
# Install xrdp
sudo apt-get install xrdp -y
systemctl restart xrdp

