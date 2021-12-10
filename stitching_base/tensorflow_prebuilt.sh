#protobuff
cd ~
wget https://github.com/protocolbuffers/protobuf/releases/download/v3.9.2/protobuf-cpp-3.9.2.zip
unzip protobuf-cpp-3.9.2.zip
cd protobuf-3.9.2/cmake
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
cd ~
rm -v protobuf-cpp-3.9.2.zip

#tensorflow cc
cd ~
wget https://storage.googleapis.com/bepro-dev/scouting_feed/tensorflow/tensorflow_cpp_jetson_2.3.1.zip
mkdir tensorflow_cc
cd tensorflow_cc
unzip ../tensorflow_cpp_jetson_2.3.1.zip
cp -rv include/* /usr/local/include

rm -v libtensorflow_cc.so libtensorflow_cc.so.2 libtensorflow_framework.so.2
ln -s libtensorflow_cc.so.2.3.1 libtensorflow_cc.so
ln -s libtensorflow_cc.so.2.3.1 libtensorflow_cc.so.2
ln -s libtensorflow_framework.so.2.3.1 libtensorflow_framework.so.2

cp -v libtensorflow_* /usr/local/lib
cd ~
rm -rfv tensorflow_cc tensorflow_cpp_jetson_2.3.1.zip
