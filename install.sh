#!/bin/bash
clear
usuario=$(whoami)
if [[ $usuario == "root" ]]; then
  cd /tmp
  mkdir atari800
  cd atari800 
  echo "Instalando emulador atari800"
  sleep 3
  echo "realizamos una actualización del sistema"
  apt update -y && apt upgrade -y
  echo "realizamos la instalacion de los paquetes necesarios"
  sleep 3
  apt install -y gcc make automake unzip wget libsdl2-dev libsdl1.2-dev
  apt autoremove -y
  echo "descargamos el emulador"
  sleep 3
  wget "https://codeload.github.com/atari800/atari800/zip/refs/tags/ATARI800_5_0_0"
  echo "descomprimimos"
  sleep 3
  unzip ATARI800_5_0_0
  echo "realizamos la configuracion"
  sleep 3
  cd atari800-ATARI800_5_0_0
  ./autogen.sh
  ./configure
  cd /src
  make
  echo "fin de la instalación"
  exit 1
else
  echo "Debes ser usuario root para instalar"
  exit 1
fi
