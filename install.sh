#!/bin/bash
config() {
    echo "Configuring jstranslate..."
    echo "Enter language codes (e.g., en, de-DE, fr) separated by commas:"
    read translations
    echo $translations > translations.txt
    echo "$translations" | tr ',' '\n' > jstranslate_langs.txt
    echo "Configuration saved."
    echo 
    echo "You still need to create a .json file for each language in the jstranslate folder. The file should be named with the language code (e.g., en.json, de-DE.json) and contain the translations like on the github page of the project shown."
}

install() {
    echo "Installing..."
    mkdir -p jstranslate
    cd jstranslate
    wget https://github.com/shuck-hh/jstranslate/releases/latest/download/main.js
    echo 'Download successful.'
    echo 'Do you want to configure jstranslate now? (y/n)'
    read config_answer
    if [ "$config_answer" == "y" ]; then
        config
    fi
    echo "Installation complete."
    exit 0
}

# main code
clear
echo "jstranslate-Installer"
echo "--------------------------"
echo
echo "This will install jstranslate to the current folder."
echo "Do you want to continue? (y/n)"

read answer

if [ "$answer" != "y" ]; then
    echo "Installation cancelled."
    exit 0
fi

echo "Starting installation..."
install