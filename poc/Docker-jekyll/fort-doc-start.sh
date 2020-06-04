#!/bin/bash

#script to automatically download latest doc for FORT

PRJ_FOLDER=FORT-validator
PRJ_BRANCH=master
PRJ_URL=https://github.com/NICMx/FORT-validator.git
PRJ_DOC=docs/

JEKYLL_VERSION=3.8

while getopts r option
do
  case "${option}"
  in
    r) rm -rf $PRJ_FOLDER;;
  esac
done

#
#sysctl fs.inotify.max_user_watches=524288
#sysctl -p
#

if ! [[ -d "$PRJ_FOLDER" ]]; then
  mkdir $PRJ_FOLDER;
  git clone $PRJ_URL $PRJ_FOLDER;
else
  if [[ -d $PRJ_FOLDER/.git ]]; then
    cd $PRJ_FOLDER
    git reset --hard HEAD
    cd ..
  else
    echo "git clone"
    rm -rf $PRJ_FOLDER;
    mkdir $PRJ_FOLDER;
#  if ! [[ "$(ls -A $PRJ_FOLDER)" ]]; then
    git clone $PRJ_URL $PRJ_FOLDER;
  fi
fi

cd $PRJ_FOLDER
git pull origin
git checkout $PRJ_BRANCH
cd docs

docker pull jekyll/jekyll

docker run --rm -p 4000:4000 --volume="$PWD:/srv/jekyll" -it jekyll/jekyll jekyll serve

echo "If the following error message is displayed, run the sysctl commands."
echo "abort: FATAL: Listen error: unable to monitor directories for changes. (SystemExit)"
echo "sudo sysctl fs.inotify.max_user_watches=524288"
echo "sudo sysctl -p"
