apt-get install python-pip
apt-get install python-virtualenv
apt-get install mysql-server mysql-client libmysqlclient-dev
virtualenv registryvirtenv
cd registryvirtenv
source bin/activate
git clone git@github.com:JDSchmitzMedia/OMS-RegistryServer.git
cd OMS-RegistryServer
pip install -r conf/requirements.txt
cd registryServer
python manage.py syncdb
python manage.py runserver 0.0.0.0:8040
