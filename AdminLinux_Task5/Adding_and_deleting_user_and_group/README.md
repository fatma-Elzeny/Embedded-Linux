# Scripts to add user to group and deleting them 

##Here is a Bash script to create a user named `yourName`, add them to the `FamilyName` group, and handle cases where the user or group already exists. It also displays relevant information for the user and group.
 
### How It Works:
1. **Group Check**: Uses `getent group` to check if the group exists.
   - If not, `groupadd` is used to create the group.
2. **User Check**: Uses `id` to verify if the user exists.
   - If not, `useradd` creates the user and assigns them to the group.
3. **Information Display**:
   - `id` displays the user's UID, GID, and group memberships.
   - `getent group` shows detailed group information.


##To delete a user and a group in Linux, you can use the `userdel` and `groupdel` commands.


### Explanation:
1. **`id "$USERNAME"`**:  
   - Checks if the user exists.
   - If the user exists, `userdel -r` is used to delete the user and their home directory.
   
2. **`getent group "$GROUPNAME"`**:  
   - Checks if the group exists.
   - If the group exists, `groupdel` deletes the group.

3. **`userdel -r "$USERNAME"`**:  
   - Deletes the user and their home directory (`-r` flag).

4. **`groupdel "$GROUPNAME"`**:  
   - Deletes the group.

5. **Safe Checks**:  
   - Ensures deletion commands are only run if the user or group exists.




