#!/usr/bin/env bash

cd ..
STARTDIR=$( pwd )

for x in $( ls ) ;
do
	#Changing to the project's dir
	cd "$x"

	#Checking if any changes are not yet commited
	if [ "$( git status | grep 'nothing to commit' )"  == "" ]; then
		echo "$x"

		read -p "Do you want to commit the changes? Press Y/y to commit: " UPDATEFLAG

		if [ "$UPDATEFLAG" == "y" ] || [ "$UPDATEFLAG" == "Y" ]; then

			#Reading the commit message and running the push script
			read -p "Please enter the commit message: " CMESSAGE

			#Commiting
			git add *
			git commit -m "$CMESSAGE"
			git push

		fi
		echo ""
	fi

	#Cding back to the starting dir
	cd $STARTDIR
done
