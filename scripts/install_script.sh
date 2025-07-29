#!/bin/bash

# Set color variables
bold=$(tput bold)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
red=$(tput setaf 1)
reset=$(tput sgr0)

echo "${bold}${blue}Welcome to this installation script!${reset}"

# Update the system
read -p "${bold}${green}Do you want to update system?${reset} (y/n) " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "${bold}${green}Updating the system...${reset}"
    yes | yay
fi

# Ask the user if they want to install each program
declare -A package_mapping=(
    ["git"]="git"
    ["docker"]="docker docker-compose"
    ["Visual Studio Code"]="visual-studio-code-bin"
    ["alacritty"]="alacritty"
    ["zsh"]="zsh"
    ["micro"]="micro"
    ["Aws-cli"]="aws-cli"
    ["Nerd font"]="ttf-iosevka-nerd"
    ["bruno"]="bruno"
    ["redis"]="Redisinsight"
    ["ngrock"]="ngrok"
    ["Beekeeper"]="beekeeper-studio-bin"
	["Remmina"]="remmina-git"
	["Joplin"]="joplin-desktop"
	["Google Chrome"]="google-chrome"
	["Android SDK"]="android-sdk android-sdk-platform-tools android-sdk-build-tools"
	["Insomnia"]="insomnia"
	["Slack"]="slack-desktop"
	["Fira code font"]="ttf-fira-code"
	["terraform"]="terraform terragrunt"
	["Filezilla"]="filezilla"
)

echo "${bold}${yellow}Do you want to install:${reset}"
for program in "${!package_mapping[@]}"; do
    read -p "$(echo "${bold}${yellow}• $program?${reset} (y/n) ")" install_program
    if [[ ! "$install_program" =~ ^[Yy]$ ]]; then
        unset package_mapping["$program"]
    fi
done

# Create a list of programs to install based on the user's input
packages_to_install=()
for program in "${!package_mapping[@]}"; do
    packages_to_install+=(${package_mapping[$program]})
done

# Install the selected programs
if [ ${#packages_to_install[@]} -gt 0 ]; then
    echo "${bold}${blue}Installing the selected programs...${reset}"
    yay -S "${packages_to_install[@]}" --noconfirm
else
    echo "${bold}${red}No programs selected for installation.${reset}"
fi

echo "${bold}${blue}Installation completed.${reset}"
