
#get necessary package
git clone --recursive  https://github.com/cmusphinx/pocketsphinx-python

#get helper script
git clone  https://github.com/malceore/helperScripts.git

#update
sudo apt-get update

#install dependensies
sudo apt-get install -y python git python-dev python-pip bison libasound2-dev libportaudio-dev python-pyaudio autoconf libtool automake gfortran g++ build-essential swig tree

cd pocketsphinx-python/

cd sphinxbase/
./autogen.sh && ./configure
sudo make install
cd ../pocketsphinx/
./autogen.sh && ./configure
make clean all
sudo make install

cat >> $HOME/.bashrc <<EOF
# Pocketsphinx
export LD_LIBRARY_PATH=/usr/local/lib 
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
EOF


cd ../ && sudo python setup.py install

#test IO
chmod +x audio_test.sh
./audio_test.sh
