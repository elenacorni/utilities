# Installazione:
apt search virtualenv
sudo apt install python-virtualenv
virtualenv matplotlib-vecchio #"matplotlib-vecchio" è il nome cartella da creare

# Per attivare l'ambiente virtuale di python:
source <path-della-cartella>/matplotlib-vecchio/bin/activate
# quindi:
source ~/matplotlib-vecchio/bin/activate

# Per installare dei pacchetti nell'ambiente virtuale:
pip search matplotlib
pip install matplotlib

# Per cambiare la versione di un pacchetto:
pip install matplotlib==1.5.3

# Per uscire dall'ambiente virtuale di python e tornare a quello corrente:
deactivate
