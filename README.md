trustframework-deploy
=====================

A set of files useful when deploying components of the OpenPDS trustframework

** The setup process outlined below requires access to IDCubed's github repository


The OpenPDS trustframework consists of 2 github projects

### 1) OMS-RegistryServer 
	https://github.com/IDCubed/OMS-RegistryServer/tree/MITv0.4
The RegistryServer is an OAuth 2.0 authorization server.  It provides a means for users to register themselves in the Trust Network, and link their account to a PDS.  **This project is currently being overlayed with an OpenID Connect service
  
### 2) OMS-PDS 
	https://github.com/IDCubed/OMS-PDS/tree/MITv0.4
The PDS is a place for users to store data, and verify claims peers and applications make against their data.  At present, the PDS stores funf data collected from android smartphones, and answers questions about that data.  The funf data serves as the basis for providing answers, and the answers serve as the basis for providing data to applications.


## Deploying on Ubuntu 12.04 LTS

	cd ~
	git clone https://github.com/JDSchmitzMedia/trustframework-deploy.git
	cd trustframework-deploy
	sudo ./prep.sh
	./deplocPDS.sh
	./deplocReg.sh
	cd /var/www/
	sudo ln -s ~/trustframework-deploy/ trustframework4
	sudo chown -h www-data:www-data trustframework4
	cd trustframework4


# Deploying With Apache
The apache configuration is in the file “trustframework4”.  If you would like to deploy with apache, copy this file to your /etc/apache2/sites-enabled/ directory.

	cp ~/trustframework-deploy/trustframework4 /etc/apache2/sites-enabled/
	service apache2 restart
