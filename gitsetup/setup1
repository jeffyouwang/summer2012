#!/bin/sh

username=$1
name=$2
email=$3
organization=uoft-tsa
repo=summer2012
gitrootdirectory=$4

DIR="$( cd "$( dirname "$0" )" && pwd )"

# set git
echo "[user]" > ~/.gitconfig
echo "  username = $username" >> ~/.gitconfig
echo "  name = $name" >> ~/.gitconfig
echo "  email = $email" >> ~/.gitconfig
echo "[push]" >> ~/.gitconfig
echo "  default = current" >> ~/.gitconfig
echo "[repository]" >> ~/.gitconfig
echo "  name = $repo" >> ~/.gitconfig
echo "  organization = $organization" >> ~/.gitconfig
echo "  root = $gitrootdirectory" >> ~/.gitconfig
echo "[branch \"$username\"]" >> ~/.gitconfig
echo "  remote = origin" >> ~/.gitconfig
echo "  merge = $username" >> ~/.gitconfig

# set ssh
cd ~
if [ ! -d ".ssh" ]; then
    mkdir .ssh
fi
cd ~/.ssh
mkdir github
cd github
ssh-keygen -t rsa  -f ~/.ssh/github/id_rsa -C $email
cd ..
echo "" >> config
echo "Host github.com" >> config
echo "IdentityFile ~/.ssh/github/id_rsa" >> config
cat github/id_rsa.pub
cd $DIR
cp ~/.ssh/github/id_rsa.pub copyme.txt
