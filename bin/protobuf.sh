#!/bin/bash
# Build Path: /app/.heroku/php/
dep_url=git://github.com/allegro/php-protobuf.git
protobuf_dir=php-protobuf
echo "-----> Building Protobuf..."

### curve25519
echo "[LOG] Downloading Protobuf"
git clone $dep_url -q
if [ ! -d "$protobuf_dir" ]; then
  echo "[ERROR] Failed to find protobuf directory $protobuf_dir"
  exit
fi
cd $protobuf_dir


/app/.heroku/php/bin/phpize
./configure 
make
make install
#BUILD_DIR=$1
#ln -s $BUILD_DIR/.heroku /app/.heroku
#export PATH=/app/.heroku/php/bin:$PATH
#bash ./install
#cd
echo "importing extension protobuf into php.ini"
echo "extension=protobuf.so" >> /app/.heroku/php/etc/php/php.ini
