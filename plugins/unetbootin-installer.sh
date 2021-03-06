#!/bin/bash
# Script written by: JM.
# This script install Unetbootin.

if command -v unetbootin >/dev/null; then
  echo $'\n Unetbootin is already installed.'
else
  # Adding Unetbootin repository.
  sudo add-apt-repository ppa:gezakovacs/ppa
	
  # Installing Unetbootin
  sudo apt-get update && sudo apt-get install unetbootin

  echo $'\n Unetbootin was installed with success.'
fi

