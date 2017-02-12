#!/bin/bash

# Script written by: Jackson Miras.
#
# This is a script inspired on fedy(http://folkswithhats.org/) that is software
# builted to easy install another software on Fedora. The problem is that haven't
# used Fedora for almos 3 years and I realy realy enjoy the experience and the time
# saving that's provided by fedy.
#
# With this thinks in mind I've decided to write my, sort of, own version of fedy
# but focused on Ubuntu that is my current Linux distribuition.
#
# This is script also uses Zenity to build the graphic user interface.

selected_item=$(zenity --list\
	--text "This is a script written to save time, choose down below the softwares that you want to install."\
	--checklist  --column "Install" --"Software id" --column "Softwares"\
		FALSE "1" "Git"\
		FALSE "2" "Git-flow"\
		FALSE "3" " Get repositories from Github and Bitbucket"\
		FALSE "4" "Htop"\
		FALSE "5" "Tmux"\
		FALSE "6" "Zsh"\
		FALSE "7" "Zsh Syntax Highlighting"\
		FALSE "8" "7zip, Rar, Unrar"\
		FALSE "9" "Java 8"\
		FALSE "10" "NVM"\
		FALSE "11" "Node Js"\
		FALSE "12" "Ruby, RVM, Rails"\
		FALSE "13" "MySQL"\
		FALSE "14" "MySQL Workbench"\
		FALSE "15" "PostgreSQL"\
		FALSE "16" "PgAdmin3"\
		FALSE "17" "Neovim"\
		FALSE "18" "Sublime Text 3"\
		FALSE "19" "Android Studio"\
		FALSE "20" "Eclipse"\
		FALSE "21" "Google Chrome"\
		FALSE "22" "Opera"\
		FALSE "23" "Dropbox"\
		FALSE "24" "pCloud"\
		FALSE "25" "qBittorrent"\
		FALSE "26" "Spotfy"\
		FALSE "27" "Clementine"\
		FALSE "28" "Vocal"\
		FALSE "29" "VLC"\
		FALSE "30" "Stremio"\
		FALSE "31" "Inkscape"\
		FALSE "32" "Slack"\
		FALSE "33" "Skype"\
		FALSE "34" "Simplenote"\
		FALSE "35" "Unetbootin"\
		FALSE "36" "Unity Tweak Tool"\
		FALSE "37" "Ubuntu Restricted Extras"\
		FALSE "38" "Syspeek"\
		FALSE "39" "Linuxbrew"\
	--separator=":" --width=1024 --height=768
)

if [[ "$selected_item" =~ "1" ]]; then
	# Installing git.
	sudo apt-get update && sudo apt-get install -y git

	# Configuring git.
	git config --global color.ui true
	git config --global user.name "Jackson Miras"
	git config --global user.email "jackmiras@gmail.com"

	# Generating ssh key.
	ssh-keygen -t rsa -b 4096
fi

if [[ "$selected_item" =~ "2" ]]; then
	# Installing Git-flow.
	sudo apt-get update && sudo apt-get install -y git-flow
fi

if [[ "$selected_item" =~ "3" ]]; then
	# Getting repositories from Github and Bitbucket.
	mkdir $HOME/Projects/
	cd $HOME/Projects/

	# Cloning the repositories.
	git clone git@github.com:jackmiras/android-studio-config.git
	git clone git@github.com:jackmiras/malaco-script.git
	git clone git@github.com:jackmiras/vim-config.git
	git clone git@github.com:jackmiras/placeholderj.git
	git clone git@github.com:jackmiras/logger.git
	git clone git@github.com:jackmiras/sublime-text-3-config.git
	git clone git@github.com:jackmiras/zshrc-config.git
	git clone git@github.com:jackmiras/AntennaPod.git
	git clone git@bitbucket.org:JacksonFlorentino/desafio-android.git
	git clone git@bitbucket.org:JacksonFlorentino/series-track-android.git
	git clone git@bitbucket.org:personalorcs/orcamento-android.git
	git clone git@bitbucket.org:personalorcs/orcamento-api.git
	git clone git@bitbucket.org:JacksonFlorentino/nubank-assignment-android.git
fi

if [[ "$selected_item" =~ "4" ]]; then
	# Installing Htop.
	sudo apt-get update && sudo apt-get install -y htop
fi

if [[ "$selected_item" =~ "5" ]]; then
	# Installing Tmux.
	sudo apt-get update && sudo apt-get install -y tmux
fi

if [[ "$selected_item" =~ "6" ]]; then
	# Installing zsh.
	sudo apt-get update && sudo apt-get install -y zsh
	# Making zsh the default shell.
	chsh -s $(which zsh)
	# Installing oh-my-zsh
	 sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	# Removing the default .zshrc file.
	rm -rf $HOME/.zshrc
	# Downloading Zsh configs from github.
	cd $HOME/Projects && git clone git@github.com:jackmiras/zshrc-config.git && cd $HOME/
	# Creating symbolic link of Zsh configs into the home of the computer.
	ln -s $HOME/Projects/zshrc-config/.zshrc $HOME/.zshrc
	# Removing default themes.
	rm -rf $HOME/.oh-my-zsh/themes
	# Creating symbolic link of Zsh themes into the home of the computer.
	ln -s $HOME/Projects/zshrc-config/themes $HOME/.oh-my-zsh
fi

if [[ "$selected_item" =~ "7" ]]; then
	# Installing Zsh Syntax Highlighting.
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [[ "$selected_item" =~ "8" ]]; then
	# Installing unpack files software.
  sudo apt-get -y install p7zip p7zip-full p7zip-rar unrar rar unace-nonfree
fi

if [[ "$selected_item" =~ "9" ]]; then
	# Adding Oracle Java 8 repository.
	sudo add-apt-repository -y ppa:webupd8team/java && sudo apt-get update
	# Installing Oracle Java 8.
	sudo apt-get -y install oracle-java8-installer
	# Setting Oracle Java 8 as default JDK.
	sudo update-java-alternatives -s java-8-oracle && sudo apt-get -y install oracle-java8-set-default
	# Removing Open JDK 7.
	sudo apt-get -y purge openjdk-7-jre openjdk-7-jre-lib openjdk-7-jre-headless
fi

if [[ "$selected_item" =~ "10" ]]; then
	# Installing Node build essential.
	sudo apt-get update && sudo apt-get install build-essential libssl-dev
	# Downloading nvm script.
	curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
	# Installing nvm.
	bash install_nvm.sh

	zenity --info --text="Close and reopen the terminal."
fi

if [[ "$selected_item" =~ "11" ]]; then
	# Enabling the nvm.sh script to run in bash scripts.
	. ~/.nvm/nvm.sh
	. ~/.profile
	. ~/.bashrc
	. ~/.zshrc
	# Installing Node.
	nvm install 7.2.0
	nvm use 7.2.0
	nvm alias default 7.2.0
	# Intalling npm.
	sudo apt-get install npm
fi

if [[ "$selected_item" =~ "12" ]]; then
	# Installing Ruby dependencies.
	sudo apt-get update && sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

	# Installing RVM.
	sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	curl -sSL https://get.rvm.io | bash -s stable
	source ~/.rvm/scripts/rvm
	rvm install 2.3.1
	rvm use 2.3.1 --default

	# Installing Bundler.
	gem install bundler

	# Installing Rails.
	gem install rails -v 4.2.6
fi

if [[ "$selected_item" =~ "13" ]]; then
	# Installing MySQL.
	sudo apt-get update && sudo apt-get install mysql-server mysql-client libmysqlclient-dev
fi

if [[ "$selected_item" =~ "14" ]]; then
	# Downloading MySQL Workbench.
	wget -P $HOME/Downloads/ http://cdn.mysql.com//Downloads/MySQLGUITools/mysql-workbench-community-6.3.8-1ubu1604-amd64.deb
	# Installing MySQL Workbench.
	sudo dpkg -i $HOME/Downloads/mysql-workbench-community-6.3.8-1ubu1604-amd64.deb && sudo apt-get -f install
	# Removing mysql-workbench-community-6.3.8-1ubu1604-amd64.deb.
	rm -rf $HOME/Downloads/mysql-workbench-community-6.3.8-1ubu1604-amd64.deb
	# Updating Ubuntu dependencies.
	sudo apt-get update && sudo apt-get upgrade
fi

if [[ "$selected_item" =~ "15" ]]; then
	# Adding PostgreSQL on Ubuntu souces.list.
	sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
	# Downloading PostgreSQL key to add as key of system repositories.
	wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
	# Installing PostgreSQL.
	sudo apt-get update && sudo apt-get install postgresql-common && sudo apt-get install postgresql-9.5 libpq-dev
fi

if [[ "$selected_item" =~ "16" ]]; then
	# Installing PgAdmin3.
	sudo apt-get update && sudo apt-get install pgadmin3
fi

if [[ "$selected_item" =~ "17" ]]; then
  # Installing xclip as a dependency required by Neovim.
  sudo apt-get install xclip

	# Installing Neovim.
	sudo apt-get install software-properties-common
	sudo apt-get install python-software-properties
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt-get update
	sudo apt-get install neovim

	if [ ! -d "$HOME/Projects/neovim-config" ]; then
		# Downloading Neovim configs from github.
		cd $HOME/Projects && git clone git@github.com:jackmiras/neovim-config.git && cd $HOME
	fi
	# Loading the Neovim plugins
	cd $HOME/Projects/neovim-config
	git submodule init && git submodule update --recursive
	# Creating a symbolic link of Neovim configurations into the .config folder of Ubuntu.
	ln -s $HOME/Projects/neovim-config/ $HOME/.config/nvim
fi

if [[ "$selected_item" =~ "18" ]]; then
	# Adding Sublime Text 3 respository.
	sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 && sudo apt-get update
	# Installing Sublime Text 3.
	sudo apt-get -y install sublime-text-installer
	# Downloading Sublime Text 3 configs from Github.
	if [ ! -d "$HOME/Projects/sublime-text-3-config" ]; then
		cd $HOME/Projects && git clone git@github.com:jackmiras/sublime-text-3-config.git && cd $HOME
	fi
	# Creating a symbolic link of Sublime Text 3 configs into the Home/.config folder of Ubuntu.
	ln -s $HOME/Projects/sublime-text-3-config $HOME/.config/sublime-text-3
fi

if [[ "$selected_item" =~ "19" ]]; then
	# Installing Android Studio dependencies.
	sudo apt-get install lib32z1 lib32ncurses5 lib32stdc++6
	# Downloading Android Studio.
	wget -P $HOME/Downloads/ https://dl.google.com/dl/android/studio/ide-zips/2.2.2.0/android-studio-ide-145.3360264-linux.zip
	# Extracting android-studio-ide-145.3360264-linux.zip into Download folder.
	unzip $HOME/Downloads/android-studio-ide-145.3360264-linux.zip -d $HOME/Downloads/
	# Moving android-studio folder from Download to the opt folder.
	sudo mv $HOME/Downloads/android-studio /opt/

	# Setting up the Android Studio launcher on Ubuntu dash.
	echo "[Desktop Entry]" >> $HOME/jetbrains-studio.desktop
	echo "Version=1.0" >> $HOME/jetbrains-studio.desktop
	echo "Type=Application" >> $HOME/jetbrains-studio.desktop
	echo "Name=Android Studio" >> $HOME/jetbrains-studio.desktop
	echo "Icon=/opt/android-studio/bin/studio.png" >> $HOME/jetbrains-studio.desktop
	echo "Exec="/opt/android-studio/bin/studio.sh" %f" >> $HOME/jetbrains-studio.desktop
	echo "Comment=Develop with pleasure!" >> $HOME/jetbrains-studio.desktop
	echo "Categories=Development;IDE;" >> $HOME/jetbrains-studio.desktop
	echo "Terminal=false" >> $HOME/jetbrains-studio.desktop
	echo "StartupWMClass=jetbrains-studio" >> $HOME/jetbrains-studio.desktop

	# Moving the jetbrains-studio.destop to the usr/share/applications folder.
	sudo mv $HOME/jetbrains-studio.desktop /usr/share/applications/

	# Executing Android Studio to generate the .AndroidStudio folder.
	sh /opt/android-studio/bin/studio.sh
	if [ ! -d "$HOME/Projects/android-studio-config" ]; then
		# Downloading custom configs of Android Studio from Github.
		cd $HOME/Projects && git clone git@github.com:jackmiras/android-studio-config.git && cd $HOME
	fi

	# Removing current configurations of Android Studio.
	rm -rf $HOME/.AndroidStudio2.2/config/codestyles
	rm -rf $HOME/.AndroidStudio2.2/config/colors
	rm -rf $HOME/.AndroidStudio2.2/config/plugins
	rm -rf $HOME/.AndroidStudio2.2/config/inspection
	rm -rf $HOME/.AndroidStudio2.2/config/options
	# Creating a symbolic link of the new Android Studio configurations into .AndroidStudio folder.
	ln -s $HOME/Projects/android-studio-config/* $HOME/.AndroidStudio2.2/config/
	# Removing Android Studio zip file from Download folder.
	rm -rf $HOME/Downloads/android-studio-ide-145.3360264-linux.zip
fi

if [[ "$selected_item" =~ "20" ]]; then
	# Downloading Eclipse.
	wget -P $HOME/Downloads/ http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/neon/1a/eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
	# Extracting eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz into Download folder.
	tar -vzxf $HOME/Downloads/eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz -C $HOME/Downloads/
	# Moving eclipse folder  from Download to the opt folder.
	sudo mv $HOME/Downloads/eclipse /opt/

	# Setting up Eclipse launcher on Ubuntu dash.
	echo "[Desktop Entry]" >> $HOME/eclipse.desktop
	echo "Version=1.0" >> $HOME/eclipse.desktop
	echo "Name=Eclipse" >> $HOME/eclipse.desktop
	echo "Exec=env UBUNTU_MENUPROXY= eclipse" >> $HOME/eclipse.desktop
	echo "Terminal=false" >> $HOME/eclipse.desktop
	echo "Icon=/opt/eclipse/icon.xpm" >> $HOME/eclipse.desktop
	echo "Type=Application" >> $HOME/eclipse.desktop
	echo "Categories=IDE;Development" >> $HOME/eclipse.desktop
	echo "X-Ayatana-Desktop-Shortcuts=NewWindow" >> $HOME/eclipse.desktop
	echo "[NewWindow Shortcut Group]" >> $HOME/eclipse.desktop
	echo "Name=New Window" >> $HOME/eclipse.desktop
	echo "Exec=env UBUNTU_MENUPROXY= eclipse" >> $HOME/eclipse.desktop
	echo "TargetEnvironment=Unity" >> $HOME/eclipse.desktop

	# Moving the eclipse.destop to the usr/share/applications folder.
	sudo mv $HOME/eclipse.desktop /usr/share/applications/

	# Removing Eclipse tar.gz file from Download folder.
	rm -rf $HOME/Downloads/eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
fi

if [[ "$selected_item" =~ "21" ]]; then
	# Downloading Google Chrome key to add as key of system repositories.
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	# Adding Google Chrome to the source list.
	sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	# Installing the stable version of Google Chrome.
	sudo apt-get update && sudo apt-get install -y google-chrome-stable && sudo apt-get -f install
fi

if [[ "$selected_item" =~ "22" ]]; then
	# Downloading opera-stable_41.0.2353.46_amd64.deb into the Download folder.
	wget -P $HOME/Downloads/ http://download4.operacdn.com/pub/opera/desktop/41.0.2353.46/linux/opera-stable_41.0.2353.46_amd64.deb
	# Installing the stable version Opera.
	sudo dpkg -i $HOME/Downloads/opera-stable_41.0.2353.46_amd64.deb && sudo apt-get -f install
	# Updating Ubuntu dependencies.
	sudo ap-get update && sudo apt-get upgrade
fi

if [[ "$selected_item" =~ "23" ]]; then
	# Download dropbox_2015.10.28_amd64.deb into the Download folder.
	wget -P $HOME/Downloads/ https://linux.dropbox.com/packages/ubuntu/dropbox_2015.10.28_amd64.deb
	# Installing Dropbox.
	sudo dpkg -i $HOME/Downloads/dropbox_2015.10.28_amd64.deb
	# Removing dropbox_2015.10.28_amd64.deb from Download folder.
	rm -rf $HOME/Downloads/dropbox_2015.10.28_amd64.deb
	# Installing Dropbox dependencies.
	sudo apt-get -f install
	# Updating Ubuntu dependencies.
	sudo apt-get update && sudo apt-get upgrade
fi

if [[ "$selected_item" =~ "24" ]]; then
	# Downloading pCloud to the Download folder.
	wget -P $HOME/Downloads/ https://c75.pcloud.com/dHZ8IsmSZJvU4uZZZmMutt7ZHkZZGNRZkZ5LUXZssw368uiJLjYQDTAP0KEsS2b0egy/pCloud_Linux_amd64_3.1.1.deb
	# Installing pCloud.
	sudo dpkg -i $HOME/Downloads/pCloud_Linux_amd64_3.1.1.deb && sudo apt-get -f install
	# Updating Ubuntu dependencies and softwares.
	sudo apt-get update && sudo apt-get upgrade
	# Removing pCloud_Linux_amd64_3.1.1.deb file from Download folder.
	rm -rf $HOME/Downloads/pCloud_Linux_amd64_3.1.1.deb
fi

if [[ "$selected_item" =~ "25" ]]; then
	# Adding qBittorrent repository.
	sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
	# Installing qBittorrent.
	sudo apt-get update && sudo apt-get install qbittorrent
fi

if [[ "$selected_item" =~ "26" ]]; then
	# Downloading Spotfy client.
	wget -P $HOME/Downloads/ http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.0.38.171.g5e1cd7b2-22_amd64.deb
	# Installing Spotfy client.
	sudo dpkg -i spotify-client_1.0.38.171.g5e1cd7b2-22_amd64.deb && sudo apt-get -f install
	# Updating Ubuntu dependencies.
	sudo apt-get install && sudo apt-get upgrade
	# Removing Spotfy file from Download folder.
	rm -rf $HOME/Downloads/spotify-client_1.0.38.171.g5e1cd7b2-22_amd64.deb
fi

if [[ "$selected_item" =~ "27" ]]; then
	# Adding Clementaine repository.
	sudo add-apt-repository ppa:me-davidsansome/clementine && sudo apt-get update
	# Installing Clementine.
	sudo apt-get install clementine
fi

if [[ "$selected_item" =~ "28" ]]; then
	# Downloading Vocal.
	wget -P $HOME/Downloads/ http://ufpr.dl.sourceforge.net/project/vocalpodcast/vocal_1.0_amd64.deb
	# Downloading Vocal dependencies.
	wget -P $HOME/Downloads/ https://launchpadlibrarian.net/201478397/libgranite2_0.3.0+r850+pkg80~ubuntu0.3.1_amd64.deb
	wget -P $HOME/Downloads/ https://launchpadlibrarian.net/201478393/libgranite-common_0.3.0+r850+pkg80~ubuntu0.3.1_all.deb
	# Installing Vocal dependencies.
	sudo dpkg -i $HOME/Downloads/libgranite2_0.3.0+r850+pkg80~ubuntu0.3.1_amd64.deb && sudo apt-get -f install
	sudo dpkg -i $HOME/Downloads/libgranite-common_0.3.0+r850+pkg80~ubuntu0.3.1_all.deb && sudo apt-get -f install
	# Installing Vocal.
	sudo dpkg -i $HOME/Downloads/vocal_1.0_amd64.deb && sudo apt-get -f install
	# Removing Vocal and his dependencies files.
	rm -rf $HOME/Downloads/vocal_1.0_amd64.deb
	rm -rf $HOME/Downloads/libgranite2_0.3.0+r850+pkg80~ubuntu0.3.1_amd64.deb
	rm -rf $HOME/Downloads/libgranite-common_0.3.0+r850+pkg80~ubuntu0.3.1_all.deb
	# Updating Ubuntu dependencies.
	sudo apt-get update && sudo apt-get upgrade
fi

if [[ "$selected_item" =~ "29" ]]; then
	# Adding VLC repositories
	sudo add-apt-repository ppa:videolan/stable-daily
	sudo add-apt-repository ppa:nicola-onorata/desktop
	# Installing VLC.
	sudo apt-get update && sudo apt-get install vlc
fi

if [[ "$selected_item" =~ "30" ]]; then
	# Downloading Stremio
	wget -P $HOME/Downloads/ http://dl.strem.io/Stremio3.6.5.linux.tar.gz
	# Creating stremio folder.
	mkdir $HOME/Downloads/stremio
	# Extracting the Stremio3.6.5.linux.tar.gz files into stremio folder.
	tar -vzxf $HOME/Downloads/Stremio3.6.5.linux.tar.gz -C $HOME/Downloads/stremio
	# Moving stremio folder from Download to opt folder.
	sudo mv $HOME/Downloads/stremio /opt/
	# Downloading the image icon.
	sudo wget -P /opt/stremio/ http://www.strem.io/3.0/stremio-white-small.png
	# Renaming the image icon.
	sudo mv /opt/stremio/stremio-white-small.png /opt/stremio/icon.png

	# Setting up Stremio launcher on Ubuntu dash.
	echo "[Desktop Entry]" >> $HOME/stremio.desktop
	echo "Version=1.0" >> $HOME/stremio.desktop
	echo "Type=Application" >> $HOME/stremio.desktop
	echo "Name=Stremio" >> $HOME/stremio.desktop
	echo "Icon=/opt/Stremio/icon.png" >> $HOME/stremio.desktop
	echo "Exec=/opt/Stremio/Stremio.sh" >> $HOME/stremio.desktop
	echo "Comment=Have fun!" >> $HOME/stremio.desktop
	echo "Categories=Video" >> $HOME/stremio.desktop
	echo "Terminal=false" >> $HOME/stremio.desktop

	# Moving the eclipse.destop to the usr/share/applications folder.
	sudo mv $HOME/stremio.desktop /usr/share/applications/

	# Removing Stremio3.6.5.linux.tar.gz file.
	rm -rf $HOME/Downloads/Stremio3.6.5.linux.tar.gz
fi

if [[ "$selected_item" =~ "31" ]]; then
	# Installing Inkscape.
	sudo apt-get update && sudo apt-get -y install inkscape
fi

if [[ "$selected_item" =~ "32" ]]; then
	# Downloading Slack.
	wget -P $HOME/Downloads/ https://downloads.slack-edge.com/linux_releases/slack-desktop-2.2.1-amd64.deb
	# Installing Slack.
	sudo dpkg -i $HOME/Downloads/slack-desktop-2.2.1-amd64.deb
	# Installing Slack dependencies.
	sudo apt-get -f install
	# Removing slack-desktop-2.2.1-amd64.deb file.
	rm -rf $HOME/Downloads/slack-desktop-2.2.1-amd64.deb
	# Updating Ubuntu softwares and dependencies.
	sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove
fi

if [[ "$selected_item" =~ "33" ]]; then
	# Downloading Skype.
	wget -P $HOME/Downloads/ https://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
	# Installing Skype.
	sudo dpkg -i $HOME/Downloads/skype-ubuntu-precise_4.3.0.37-1_i386.deb
	# Installing Skype dependencies.
	sudo apt-get -f install
	# Removing skype-ubuntu-precise_4.3.0.37-1_i386.deb file.
	rm -rf $HOME/Downloads/skype-ubuntu-precise_4.3.0.37-1_i386.deb
	# Updating Ubuntu softwares and dependencies.
	sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove
fi

if [[ "$selected_item" =~ "34" ]]; then
	# Downloading Simplenote.
	wget -P $HOME/Downloads/ https://github.com/Automattic/simplenote-electron/releases/download/v1.0.6/simplenote-1.0.6.deb
	# Installing Simplenote.
	sudo dpkg -i $HOME/Downloads/simplenote-1.0.6.deb && sudo apt-get -f install
	# Removing simplenote-1.0.6.deb file.
	rm -rf $HOME/Downloads/simplenote-1.0.6.deb
	# Updating Ubuntu softwares and dependencies.
	sudo apt-get update && sudo apt-get upgrade
fi

if [[ "$selected_item" =~ "35" ]]; then
	# Adding Unetbootin repository.
	sudo add-apt-repository ppa:gezakovacs/ppa
	# Installing Unetbootin
	sudo apt-get update && sudo apt-get install unetbootin
fi

if [[ "$selected_item" =~ "36" ]]; then
	# Installing Unity Tweek Tool
	sudo apt-get update && sudo apt-get install unity-tweak-tool
fi

if [[ "$selected_item" =~ "37" ]]; then
	# Installing Restricted-Extras.
	sudo apt-get -y install ubuntu-restricted-extras
fi

if [[ "$selected_item" =~ "38" ]]; then
	# adding syspeek repository.
	sudo add-apt-repository ppa:nilarimogard/webupd8 && sudo apt-get update
	# installing syspeek.
	sudo apt-get install syspeek
fi

if [[ "$selected_item" =~ "39" ]]; then
	# Installing Linuxbrew dependencies.
	sudo apt-get install build-essential curl git python-setuptools ruby
	# Installing Linuxbrew.
	git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
	# Exporting environment variables of Linuxbrew.
	echo "export PATH='$HOME/.linuxbrew/bin:$PATH'" >> ~/.bashrc
	echo "export MANPATH='$HOME/.linuxbrew/share/man:$MANPATH'" >> ~/.bashrc
	echo "export INFOPATH='$HOME/.linuxbrew/share/info:$INFOPATH'" >> ~/.bashrc
fi

#################Uninstalling unused softwares from Ubuntu.##################
if command -v onboard >/dev/null; then
# Removing Onboard from the system.
	sudo apt-get remove --purge onboard
	sudo apt-get autoremove
fi

if command -v gnome-mahjongg >/dev/null; then
	# Removing GNOME Mahjongg.
	sudo apt-get remove --purge gnome-mahjongg
	sudo apt-get autoremove
fi

if command -v gnome-sudoku >/dev/null; then
	# Removing GNOME Sudoku.
	sudo apt-get remove --purge gnome-sudoku
	sudo apt-get autoremove
fi

if command -v gnome-orca >/dev/null; then
	# Removing GNOME Orca.
	sudo apt-get remove --purge gnome-orca
	sudo apt-get autoremove
fi

if command -v gnome-mines>/dev/null; then
	# Removing GNOME Mines.
	sudo apt-get remove --purge gnome-mines
	sudo apt-get autoremove
fi

if command -v rhythmbox >/dev/null; then
	# Removing Rhythmbox.
	sudo apt-get remove --purge rhythmbox
	sudo apt-get autoremove
fi

if command -v thunderbird >/dev/null; then
	# Removing Thunderbird.
	sudo apt-get remove --purge thunderbird*
	sudo apt-get autoremove
fi

zenity --info --title "Installation finished" --text "Installation finished with success!"
