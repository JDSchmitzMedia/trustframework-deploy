apt-get install python-pip
apt-get install python-virtualenv
apt-get install mongodb mongodb-server
service mongodb start
apt-get install build-essential
apt-get update
virtualenv pdsvirtenv
cd pdsvirtenv
source bin/activate
git clone https://github.com/JDSchmitzMedia/OMD-PDS.git
cd OMS-PDS
pip install -r conf/requirements.txt
python manage.py syncdb
python manage.py runserver 0.0.0.0:8041

