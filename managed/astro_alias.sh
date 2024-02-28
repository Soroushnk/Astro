#!/bin/bash

# Function to check if .bash_aliases exists and create it if not
check_bash_aliases() {
    if ! [ -f ~/.bash_aliases ]; then
        touch ~/.bash_aliases
    fi
}

# Function to add the alias to .bash_aliases or .bashrc
add_alias() {
    echo "alias astro='curl -sSL https://raw.githubusercontent.com/Soroushnk/Astro/main/Astro.sh | bash'" >> ~/.bash_aliases
    echo "Alias 'astro' has been added successfully."
}

# Main script logic
check_bash_aliases
add_alias

# Reload the .bashrc file to apply the changes
source ~/.bashrc