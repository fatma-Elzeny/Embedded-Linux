#!/bin/bash

# Variables
USERNAME="Fatma"
GROUPNAME="Elzeny"

# Check if the group exists, create it if not
if getent group "$GROUPNAME" > /dev/null 2>&1; then
    echo "Group '$GROUPNAME' already exists."
else
    echo "Creating group '$GROUPNAME'..."
    groupadd "$GROUPNAME"
    echo "Group '$GROUPNAME' created successfully."
fi

# Check if the user exists
if id "$USERNAME" > /dev/null 2>&1; then
    echo "User '$USERNAME' already exists."
else
    echo "Creating user '$USERNAME'..."
    useradd -m -G "$GROUPNAME" "$USERNAME"
    echo "User '$USERNAME' created and added to group '$GROUPNAME'."
fi

# Display user information
echo "User information for '$USERNAME':"
id "$USERNAME"

# Display group information
echo "Group information for '$GROUPNAME':"
getent group "$GROUPNAME"

echo "Script completed successfully."

