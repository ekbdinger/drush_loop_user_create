#!/bin/bash

# this creates accounts for people with email accounts
 

# for user in $list
for email in `cat /Users/paul/shell_scripts/drush_user_create/users_example_file`
   do
      	echo "Their email is $email"
      	sleep 1
      	echo ""
      	username=`echo $email | cut -d@ -f1`
	#cut -d@ -f1 $user
	#$newuser = "hello"
	echo "their username is $username"
	echo " "
	echo " "

drush @live ucrt $username --mail=$email 

# omg it has worked up to this point!!!
# it's 1:22 on Thursday July 12, 2012

drush @live ublk $username
drush @live urol "General Role" $username

echo " "
echo "SQL Time"
echo " "
drush @live sqlq "UPDATE users SET DATA = (select data2 from dummytable) WHERE name = '$username'"

drush @live uublk $username

echo $username >> "archive_users_created/user_list_$(date +%Y_%m_%d).txt"

echo " "
echo " "
echo " the user account $username was created"
echo " "
echo "******************************************** "
echo " "
echo " "
done
