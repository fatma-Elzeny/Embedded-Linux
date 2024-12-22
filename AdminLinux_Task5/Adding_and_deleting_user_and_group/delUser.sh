#!/bin/bash

# Variables
USERNAME="Fatma"
GROUPNAME="Elzeny"

# Delete the user if it exists
if id "$USERNAME" > /dev/null 2>&1; then
    echo "Deleting user '$USERNAME'..."
    userdel -r "$USERNAME"
    echo "User '$USERNAME' deleted successfully."
else
    echo "User '$USERNAME' does not exist."
fi

# Delete the group if it exists
if getent group "$GROUPNAME" > /dev/null 2>&1; then
    echo "Deleting group '$GROUPNAME'..."
    groupdel "$GROUPNAME"
    echo "Group '$GROUPNAME' deleted successfully."
else
    echo "Group '$GROUPNAME' does not exist."
fi

echo "Script completed."

