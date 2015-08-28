#!/bin/sh
user=$(whoami)
reponame="$1"
if [ "$user" = "" ]; then
read -p "Enter Github username: " user
fi
if [ "$reponame" = "" ]; then
read -p "Enter Github Repository Name: " reponame
fi
mkdir ./$reponame
cd $reponame
curl -u "$user" https://api.github.com/user/repos -d "{\"name\":\"$reponame\"}"
git init
touch README.md
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:T04435/$reponame.git
git push -u origin master