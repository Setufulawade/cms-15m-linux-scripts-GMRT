# Please check the link below for complete project report

[Project Report](https://github.com/Setufulawade/cms-15m-linux-scripts-GMRT/blob/b062615ccf9ca1e6d839dc68c68716104e20d649/GMRT%2015m%20Project%20report.docx.pdf)

# How to use
------------------------------------------------------------------------------------------------------------------------------

Open the terminal in linux-script folder and run the following command 
>chmod +x runfirefoxdocker.sh

after executing the above command execute the script using the following command inside the terminal-
>./runfirefoxdocker.sh

--------------------------------------------------------------------------------------------------------------------------------

# Logic
--------------------------------------------------------------------------------------------------------------------------------
for logic of the script refer Script_logic_diagram.pdf inside the folder

Description of the script-

1.runfirefoxdocker.sh - Check the whether docker is running or not. if docker is not running redirects to packagechecker.sh else loads the cms15m:v1 image and redirects to cmsfirefox.sh

2.cmsfirefox.sh - terminate the container and starts a new container with firefox

3.packagechecker.sh - its checks which package manager the linux machine is running, apt or yum and redirects to aptinstaller.sh or yuminstaller.sh accordingly.

4.aptinstaller.sh - installs docker and installs the docker image present inside the folder then redirects to docker_status.sh

5.yuminstaller.sh - installs docker and installs the docker image present inside the folder then redirects to docker_status.sh

-----------------------------------------------------------------------------------------------------------------------------------
![Image Alt Text](scriptlogic1.drawio_page-0001.jpg)
