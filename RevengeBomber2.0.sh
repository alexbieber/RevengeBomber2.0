#!/bin/bash

detect_distro() {
    if [[ "$OSTYPE" == linux-android* ]]; then
            distro="termux"
    fi

    if [ -z "$distro" ]; then
        distro=$(ls /etc | awk 'match($0, "(.+?)[-_](?:release|version)", groups) {if(groups[1] != "os") {print groups[1]}}')
    fi

    if [ -z "$distro" ]; then
        if [ -f "/etc/os-release" ]; then
            distro="$(source /etc/os-release && echo $ID)"
        elif [ "$OSTYPE" == "darwin" ]; then
            distro="darwin"
        else 
            distro="invalid"
        fi
    fi
}

pause() {
    read -n1 -r -p "Press any key to continue..." key
apt-get update
apt-get upgrade
apt-get install python
}
banner() {
    clear
    echo -e "\e[1;31m"
    if ! [ -x "$(command -v figlet)" ]; then
        echo 'Introducing RevengeBomber'
    else
                 figlet RevengeBomber2.0
    fi
    if ! [ -x "$(command -v toilet)" ]; then
        echo -e "\e[4;34m This Bomber Was Created By \e[1;32mAlex Bieber \e[0m"
    else
        echo -e "\e[1;34mCreated By \e[1;34m"
        figlet Alex Bieber
    printf "\033[1;93m[\033[1;77m::\033[1;93m]	    \033[1;92m   Code by : \033[1;97m   AlexBieber	    \033[1;93m[\033[1;77m::\033[1;93m]"
	printf "\n\033[1;93m[\033[1;77m::\033[1;93m]	\033[1;92mmodify code by : \033[1;97m Alex Bieber \033[1;93m[\033[1;77m::\033[1;93m]\n"
    echo " "
    echo " "
    echo -e            *Requirements:*

    echo -e '\033[1;36m'            ➡️ '\033[1;31m'100 MB data*
    echo -e '\033[1;36m'            ➡️ '\033[1;31m'200 MB storage*
    echo -e '\033[1;36m'            ➡️ '\033[1;31m'No root*
    echo -e '\033[1;36m'            ➡️ '\033[1;31m'Data Connection*
    fi
    
    echo " "

}

init_environ(){
    declare -A backends; backends=(
        ["arch"]="pacman -S --noconfirm"
        ["debian"]="apt-get -y install"
        ["ubuntu"]="apt -y install"
        ["termux"]="apt -y install"
        ["fedora"]="yum -y install"
        ["redhat"]="yum -y install"
        ["SuSE"]="zypper -n install"
        ["sles"]="zypper -n install"
        ["darwin"]="brew install"
        ["alpine"]="apk add"
    )

    INSTALL="${backends[$distro]}"

    if [ "$distro" == "termux" ]; then
        PYTHON="python"
        SUDO=""
    else
        PYTHON="python3"
        SUDO="sudo"
    fi
    PIP="$PYTHON -m pip"
}

install_deps(){
    
    packages=(openssl git $PYTHON  figlet toilet)
    if [ -n "$INSTALL" ];then
        for package in ${packages[@]}; do
            $SUDO $INSTALL $package
        done
        $PIP install -r requirements.txt
    else
        echo "We could not install dependencies."
        echo "Please make sure you have git, python3, pip3 and requirements installed."
        echo "Then you can execute bomber.py ."
        exit
    fi
}

banner
pause
detect_distro
init_environ
if [ -f .update ];then
    echo "All Requirements Found...."
else
    echo 'Installing Requirements....'
    echo .
    echo .
    install_deps
    echo This Script Was Made By Alex Bieber > .update
    echo 'Requirements Installed....'
    pause
fi
while :
do
    banner
    
    echo " "
    echo -e "'\033[1;31m                           ⫸ Coded by\033[1;32m AlexBieber\033[1;31m ⫷\033[0m"
    echo -e "'\033[1;31m                         ⫸\033[1;33m Alex Bieber\033[1;31m ⫷\033[0m"
    echo 
    echo -e "'\033[1;36m############################# \033[1;32m [Features] \033[1;36m ###################################"
echo " "
echo " "
echo -e " \033[1;31m                         ➡️ \033[1;33m  [1️⃣] Sms bombing"
echo -e " \033[1;31m                         ➡️ \033[1;33m  [2️⃣] Call bombing"
echo -e " \033[1;31m                         ➡️ \033[1;33m  [3️⃣] Mail bombing"
echo -e " \033[1;31m                         ➡️ \033[1;33m  [4️⃣] Whatsapp bombing (coming soon)"
echo -e " \033[1;31m                         ➡️ \033[1;33m  [5️⃣] Update script"
echo -e " \033[1;31m                         ➡️ \033[1;33m  [6️⃣] exit"
echo " "
echo " "
echo -e "\033[1;36m ############################## \033[1;32m [SELECT] \033[1;36m ####################################"
echo " "
  
    read ch
    clear
   if [ $ch -eq 1 ];then
        cd $HOME
        cd RevengeBomber2.0
        python3 bomber.py
       
        exit
    elif [ $ch -eq 2 ];then
        cd $HOME
        cd RevengeBomber2.0
        python3 bomber.py
        
        exit
        exit
    elif [ $ch -eq 3 ];then
         cd $HOME
        git clone https://github.com/ha-mrx/Emailbomb
         cd Emailbomb
        chmod +x Emailbomb.py
        python2 Emailbomb.py

        exit
    elif [ $ch -eq 4 ];then
        cd $HOME
        cd RevengeBomber2.0
        bash RevengeBomber2.0.sh
    elif [ $ch -eq 5 ];then
        echo -e "\e[1;34m Downloading Latest Files..."
        cd $HOME
        rm -rf RevengeBomber
        https://github.com/AlexBieber/RevengeBomber-2.0
        cd RevengeBomber2.0
        bash RevengeBomber2.0.sh
       
        exit
    elif [ $ch -eq 6 ];then
        cd $HOME
        exit
        
    else
        echo -e "\e[4;32m Invalid Input !!! \e[0m"
        pause
    fi
done