#!/usr/bin/env bash

rm -rf Release
mkdir Release && cd Release && cmake -D CMAKE_BUILD_TYPE=Release ..

make -j $(nproc --all)

#get random string 
random_name=`tr -dc A-Za-z0-9 </dev/urandom | head -c 13 `

mv libOsiris.so $random_name
cp ../run.sh ./
sed -i "s/libOsiris.so/$random_name/" run.sh
