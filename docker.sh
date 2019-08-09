#!/bin/bash

# A Bash script by Pavon Dunbar

# This script, when executed, will ask the requestor for a term to search the Docker hub, retrieve the Docker images relative
# to that term, and pulls the image to store on the user's local server. In addition, it will give the requestor the option
# to remove the image from the server.

echo "Hello there. Please enter a search term so we can locate a Docker image for you."
read a;
echo "Perfect. I will locate docker images now for you. Give me a few seconds to retrieve the results."
echo
docker search $a
echo
echo "Your image results are above. Next, let's select one image you would like to use."
echo
echo "Highlight the image you would like to pull and paste it below:"
read b;
echo
echo "Awesome! Let's pull that image for you. Give me one second."
echo
docker pull $b
echo
echo "OK you're all done. Your image ID is below:"
echo
docker images
echo
echo "Would you like to remove the image for your local repository? (yes/no)"
read c;
if [ "$c" == "yes" ]
then
        echo "Sure thing. Paste the Docker image ID below:"
        read d;
        echo "Thanks. Let's remove that image from your repository. Give me a second, please."
        echo
        docker rmi -f $d
        echo
        echo "OK. Image $d has been removed from your repository. Thanks for using Docker!"
else
        echo "No problem. We'll keep the image in your repository. Thanks for using Docker!"
fi
