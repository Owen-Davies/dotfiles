apt-get update; apt-get install -y vim tmux xinit git build-essential wget curl sudo ranger htop conky

# set vim as default git editor
git config --global core.editor "vim"

apt-get install -y libx11-dev libxft-dev libxinerama-dev

update-alternatives --set editor /usr/bin/vim.basic

sudo apt-get install libxrandr-dev


#################################################################
# Install Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install 
sudo apt-get install libasound2 -y


#################################################################
# Install firefox
echo "deb http://ftp.us.debian.org/debian/ unstable main contrib non-free" >> /etc/apt/sources.list

echo "Package: *" >> /etc/apt/preferences
echo "Pin: release a=stable" >> /etc/apt/preferences
echo "Pin-Priority: 900" >> /etc/apt/preferences
echo "" >> /etc/apt/preferences
echo "Package: *" >> /etc/apt/preferences
echo "Pin: release a=unstable" >> /etc/apt/preferences
echo "Pin-Priority: 10" >> /etc/apt/preferences

apt-get update
apt-get install -t unstable firefox -y 


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
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next

sudo apt update
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret remmina-plugin-spice -y


#################################################################
# Install Nextcloud for cloud storage
apt-get install software-properties-common -y
touch /etc/apt/sources.list.d/nextcloud-client.list

echo "deb http://ppa.launchpad.net/nextcloud-devs/client/ubuntu zesty main" > /etc/apt/sources.list.d/nextcloud-client.list
echo "deb-src http://ppa.launchpad.net/nextcloud-devs/client/ubuntu zesty main" > /etc/apt/sources.list.d/nextcloud-client.list

apt-key adv --recv-key --keyserver keyserver.ubuntu.com AD3DD469

sudo apt-get update
sudo apt install nextcloud-client -y


#################################################################
# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


#################################################################
# Create symlinks for config files
ln -s .vimrc ~/.vimrc
ln -s .xinitrc ~/.xinitrc


#################################################################
# Install libreoffice
sudo add-apt-repository ppa:libreoffice/ppa
sudo apt-get update
sudo apt-get install libreoffice -y


#################################################################
# Install docker
## Uninstall old versions
sudo apt-get remove docker docker-engine docker.io

## Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y ca-certificates software-properties-common

## Add dockers office GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

## Add repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
## Update
sudo apt-get update

## Install Docker CE
sudo apt-get install docker-ce -y

## Add current user to be able to run docker as that user
sudo usermod -aG docker $(whoami)

## To apply the new group membership, log out of the server and back in, or type the following:
su - ${USER}

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
# Install bm for bookmarks management
## Clone bm repo
git clone https://github.com/tj/bm.git ~/source/bm

## Install bm dependencies
sudo apt-get install cutycapt xsel -y

cd ~/source/bm/
sudo make -C ~/source/bm/install
