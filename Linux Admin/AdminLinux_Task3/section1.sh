#!/bin/bash

# Check if the .bashrc file exists in the user's home directory
if [ -f "$HOME/.bashrc" ]; then
    echo "The .bashrc file exists. Appending new environment variables..."
    
    # Append the HELLO environment variable and LOCAL variable
    echo "export HELLO=\$HOSTNAME" >> "$HOME/.bashrc"
    echo " LOCAL=\$(whoami)" >> "$HOME/.bashrc"
    
    echo "Variables added successfully!"
else
    echo "The .bashrc file does not exist. Creating one..."
    
    # Create a new .bashrc file with the necessary variables
    echo "export HELLO=\$HOSTNAME" > "$HOME/.bashrc"
    echo "LOCAL=\$(whoami)" >> "$HOME/.bashrc"
    
    echo ".bashrc file created and variables added."
fi

# Open another terminal
echo "Opening another terminal..."
gnome-terminal 

