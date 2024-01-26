#!/bin/bash

echo "Checking installed version..."
OLD_Build=`su steam -c '/home/steam/steamcmd/steamcmd.sh +force_install_dir "/palworld" +login anonymous +app_status 2394010 +quit' | grep -e "BuildID" | awk '{print $8}'`
echo "Old BuildID: $OLD_Build"

echo "Updating the game server..."
su steam -c '/home/steam/steamcmd/steamcmd.sh +force_install_dir "/palworld" +login anonymous +app_update 2394010 validate +quit' > /dev/null

echo "Checking newer installed verison..."
NEW_Build=`su steam -c '/home/steam/steamcmd/steamcmd.sh +force_install_dir "/palworld" +login anonymous +app_status 2394010 +quit' | grep -e "BuildID" | awk '{print $8}'`
echo "New BuildID: $NEW_Build"

# Check if updated.
if [ $OLD_Build = $NEW_Build ]; then
    echo "The server already up to date."
else
    echo "Updated the server successfully! The server will restart in 5 minutes."
    rcon-cli Shutdown 300 "There is a newer version of Palworld! This server will restart in 5 minutes to apply update. Please prepare to exit the game."
fi