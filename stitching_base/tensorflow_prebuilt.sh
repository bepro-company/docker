#protobuff
cd ~
wget https://github.com/protocolbuffers/protobuf/releases/download/v3.9.2/protobuf-cpp-3.9.2.zip
unzip protobuf-cpp-3.9.2.zip
cd protobuf-3.9.2/cmake
mkdir build && cd build
cmake ..
make -j8
sudo make install
cd ~
rm protobuf-cpp-3.9.2.zip

#tensorflow cc
cd ~
wget https://storage.googleapis.com/bepro-dev/scouting_feed/tensorflow/tensorflow_cpp_jetson_2.3.1.zip
mkdir tensorflow_cc
cd tensorflow_cc
unzip ../tensorflow_cpp_jetson_2.3.1.zip
cp -r include/* /usr/local/include

rm libtensorflow_cc.so
rm libtensorflow_cc.so.2
ln -s libtensorflow_cc.so.2.3.1 libtensorflow_cc.so
ln -s libtensorflow_cc.so.2.3.1 libtensorflow_cc.so.2
rm libtensorflow_framework.so.2
ln -s libtensorflow_framework.so.2.3.1 libtensorflow_framework.so.2

cp libtensorflow_* /usr/local/lib
cd ~
rm -r tensorflow_cc
rm tensorflow_cpp_jetson_2.3.1.zip
