#trustframework-deploy 

This project is a set of files useful when deploying components of the OpenPDS trustframework, which was developed by Sandy Pentland's group at the MIT Media Lab as a means of collecting data, and giving it back to the users.

NOTE: The setup process outlined below requires access to IDCubed's github repository



## Components
The OpenPDS trustframework consists of 2 github projects

### OMS-RegistryServer 
	https://github.com/IDCubed/OMS-RegistryServer/tree/MITv0.4
The RegistryServer is an OAuth 2.0 authorization server.  It provides a means for users to register themselves in the Trust Network, and link their account to a PDS.  **This project is currently being overlayed with an OpenID Connect service
  
### OMS-PDS 
	https://github.com/IDCubed/OMS-PDS/tree/MITv0.4
The PDS is a place for users to store data, and verify claims peers and applications make against their data.  At present, the PDS stores funf data collected from android smartphones, and answers questions about that data.  The funf data serves as the basis for providing answers, and the answers serve as the basis for providing data to applications.


## Deploying on Ubuntu 12.04 LTS

### Development Environment

The steps outlined below will help you set up a development environment that is easily extended onto a apache "production" type environment if you so choose.

	cd ~
	git clone https://github.com/JDSchmitzMedia/trustframework-deploy.git
	cd trustframework-deploy
	sudo ./prep.sh
	./deplocReg.sh
	
	Look for
	Development server is running at http://0.0.0.0:8040/
	Quit the server with CONTROL-C.
	
	If you are running this on an environment other than your local environment, you will need to find a static IP address for your machine.

You can now check to see if the RegistryServer is up and running on port 8040.  [your RegistryServer at localhost](http://127.0.0.1:8040)
	
	./deplocPDS.sh
	
Again check to see if the PDS is running on port 8041.  [your PDS at localhost](http://127.0.0.1:8041/home)

Then, make sure we set everything up for a full deployment.

	cd /var/www/
	sudo ln -s ~/trustframework-deploy/ trustframework4
	sudo chown -h www-data:www-data trustframework4
	cd trustframework4


### Apache

The apache configuration is in the file “trustframework4”.  If you would like to deploy with apache, copy this file to your /etc/apache2/sites-enabled/ directory.

	cp ~/trustframework-deploy/trustframework4 /etc/apache2/sites-enabled/
	service apache2 restart



### OpenID Connect

The trustframework is in the process of integrating with OpenID Connect.  To prepare for OpenID Connect's installation:
	
	sudo apt-get install openjdk-6-jre
	sudo apt-get update
	sudo vi /etc/environment
	JAVA_HOME="/usr/lib/jvm/java-6-openjdk-amd64"
	JRE_HOME="$JAVA_HOME/jre"
