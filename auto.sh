#!/usr/bin/env bash

git checkout master;
git fetch origin;
git pull;
rm -f seed;
touch seed;
current_time=$(date "+%Y.%m.%d-%H.%M.%S");
echo $current_time > seed;
git add .;
git commit -am "[Auto] Push Data Auto";
git push origin master;