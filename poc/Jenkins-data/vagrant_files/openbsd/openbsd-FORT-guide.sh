echo 'Iniciando la instalación de FORT en OpenBSD'
git clone https://github.com/NICMx/FORT-Validator.git &> /dev/null
cd FORT-Validator && git checkout 1.3.0 &> /dev/null
cd FORT-Validator && export AUTORECONF_VERSION=2.69 && export AUTOCONF_VERSION=2.69 && export AUTOMAKE_VERSION=1.16 && ./autogen.sh &> /dev/null && env CC=clang CFLAGS=-I/usr/local/include LDFLAGS=-L/usr/local/lib ./configure &> /dev/null && make &> /dev/null && sudo make install &> /dev/null
echo "yes" > ./FORT-Validator/fort_setup.sh FORT-Validator/examples/tal/ &> /dev/null
echo "Terminando la instalación de $(fort --version)  en OpenBSD"
#Ejecutando pruebas
echo 'Iniciando las pruebas en OpenBSD'
echo 'sudo fort --tal FORT-Validator/examples/tal/ --log.level info --mode standalone'
sudo fort --tal FORT-Validator/examples/tal/ --log.level info --mode standalone
echo 'sudo fort --tal FORT-Validator/examples/tal/ --log.level info --mode standalone --validation-log.enabled --validation-log.level error'
sudo fort --tal FORT-Validator/examples/tal/ --log.level info --mode standalone --validation-log.enabled --validation-log.level error
echo "Terminando las pruebas. FORT fue instalado y ejecutado exitosamente en OpenBSD"
exit 0
