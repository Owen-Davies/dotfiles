apt-get update; apt-get install -y vim tmux xinit git build-essential wget curl sudo

apt-get install -y libx11-dev libxft-dev libxinerama-dev

update-alternatives --set editor /usr/bin/vim.basic

sudo apt-get install libxrandr-dev

# Install Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install 
sudo apt-get install libasound2


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
apt-get install -t unstable firefox

# Install pass for password management
sudo apt-get install pass -y

# Install email (neomutt)
sudo apt-get install neomutt isync msmtp

# Install remmina for RDP management
echo 'deb https://ftp.debian.org/debian stretch-backports main' | sudo tee --append /etc/apt/sources.list.d/stretch-backports.list >> /dev/null
sudo apt update
sudo apt install -t stretch-backports remmina remmina-plugin-rdp remmina-plugin-secret remmina-plugin-spice

# Install Nextcloud for cloud storage
apt-get install software-properties-common 
touch /etc/apt/sources.list.d/nextcloud-client.list

cat "deb http://ppa.launchpad.net/nextcloud-devs/client/ubuntu zesty main" > /etc/apt/sources.list.d/nextcloud-client.list
cat "deb-src http://ppa.launchpad.net/nextcloud-devs/client/ubuntu zesty main" > /etc/apt/sources.list.d/nextcloud-client.list

apt-key adv --recv-key --keyserver keyserver.ubuntu.com AD3DD469

sudo apt-get update
sudo apt install nextcloud-client -y

# Install


