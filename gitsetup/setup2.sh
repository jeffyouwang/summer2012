#!/bin/sh

username=`git config --get user.username`
organization=`git config --get repository.organization`
repo=`git config --get repository.name`
gitrootdirectory=`git config --get repository.root`

DIR="$( cd "$( dirname "$0" )" && pwd )"

mkdir $gitrootdirectory
cd $gitrootdirectory
git clone git@github.com:$organization/$repo.git
cd $repo
git branch $username
git checkout $username
git push
cd $DIR
