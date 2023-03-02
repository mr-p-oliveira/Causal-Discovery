#!/bin/bash

GREEN="\033[1;32m"
RED="\033[1;31m"
NOCOLOR="\033[0m"

echo -e "${RED} 



  ██████ ▓█████ ▄▄▄█████▓ █    ██  ██▓███  
▒██    ▒ ▓█   ▀ ▓  ██▒ ▓▒ ██  ▓██▒▓██░  ██▒
░ ▓██▄   ▒███   ▒ ▓██░ ▒░▓██  ▒██░▓██░ ██▓▒
  ▒   ██▒▒▓█  ▄ ░ ▓██▓ ░ ▓▓█  ░██░▒██▄█▓▒ ▒
▒██████▒▒░▒████▒  ▒██▒ ░ ▒▒█████▓ ▒██▒ ░  ░
▒ ▒▓▒ ▒ ░░░ ▒░ ░  ▒ ░░   ░▒▓▒ ▒ ▒ ▒▓▒░ ░  ░
░ ░▒  ░ ░ ░ ░  ░    ░    ░░▒░ ░ ░ ░▒ ░     
░  ░  ░     ░     ░       ░░░ ░ ░ ░░       
      ░     ░  ░            ░              
                                           

          
${NOCOLOR}
"

function instl_pyth {
	read -p "Do you want to install Python?. (y)Yes/(n)No/(c)Cancel:- " choice

	case $choice in
		[yY]* ) sudo apt install python3 ;;
		[nN]* ) echo "Python ver =>3.0.0 needed" ;;
		[cC] ) echo "Installation cancelled" 
			exit 1 ;;
		*) exit ;;
	esac
}



function require {
	echo "numpy==1.21.5" > requirements.txt
	echo "scipy==1.8.0" >> requirements.txt
	echo "numba==0.55.1" >> requirements.txt
	
}

function require_pyth {
	if which python3 >/dev/null; then
   		echo -e "[•] Python3 is ${GREEN} installed. ${NOCOLOR}"
   		require
	else
    		echo -e "[•] Python is ${RED} not installed. ${NOCOLOR}"
    		instl_pyth
    		require
	fi
}

if [ -d "Data_thesis" ] ; then
	echo 
	echo -e "[•] ${RED} Work folder already exist ${NOCOLOR}"

else
	
	mkdir -p Data_Thesis
	echo -e "[•] Work Folder ${GREEN} Created ${NOCOLOR}"
	
	cd Data_Thesis
	require_pyth
	wget https://storage.googleapis.com/ptb-xl-1.0.1.physionet.org/ptb-xl-a-large-publicly-available-electrocardiography-dataset-1.0.1.zip
	echo -e "[•] Unzip ${GREEN} Started ${NOCOLOR}"
	unzip -q ptb-xl-a-large-publicly-available-electrocardiography-dataset-1.0.1.zip
	echo -e "[•] Unzip ${GREEN} Done ${NOCOLOR}"
	mv ptb-xl-a-large-publicly-available-electrocardiography-dataset-1.0.1 PTB-XL
	rm -rf ptb-xl-a-large-publicly-available-electrocardiography-dataset-1.0.1.zip
	echo -e "[•] Zip ${GREEN} Removed ${NOCOLOR}"
	echo -e "[-] PTB-XL ${GREEN} Created ${NOCOLOR}"
	
	wget https://irhythm.github.io/public_data/CARDIOL_MAY_2017.zip
	echo -e "[•] Unzip ${GREEN} Started ${NOCOLOR}"
	unzip -q CARDIOL_MAY_2017.zip
	echo -e "[•] Unzip ${GREEN} Done ${NOCOLOR}"
	mv CARDIOL_MAY_2017 CARDIOL
	rm -rf CARDIOL_MAY_2017.zip
	echo -e "[•] Zip ${GREEN} Removed ${NOCOLOR}"
	echo -e "[-] CARDIOL ${GREEN} Created ${NOCOLOR}"
	
	wget https://figshare.com/ndownloader/files/15652862 -O ECGDataDesnoised.zip
	echo -e "[•] Unzip ${GREEN} Started ${NOCOLOR}"
	unzip ECGDataDesnoised.zip
	echo -e "[•] Unzip ${GREEN} Done ${NOCOLOR}"
	mv ECGDataDesnoised Chapman
	rm -rf ECGDataDesnoised.zip
	echo -e "[•] Zip ${GREEN} Removed ${NOCOLOR}"
	echo -e "[-] Chapman ${GREEN} Created ${NOCOLOR}"
	
	wget https://physionet.org/files/challenge-2017/1.0.0/training2017.zip
	echo -e "[•] Unzip ${GREEN} Started ${NOCOLOR}"
	unzip -q training2017.zip
	echo -e "[•] Unzip ${GREEN} Done ${NOCOLOR}"
	mv training2017 Clifford
	rm -rf training2017.zip
	echo -e "[•] Zip ${GREEN} Removed ${NOCOLOR}"
	echo -e "[-] Cliford ${GREEN} Created ${NOCOLOR}"
	
	
	echo -e "[•] (•̀ᴗ•́ )و Done and Ready to work"
fi



