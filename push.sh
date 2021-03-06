#!/bin/bash

for file in `ls`
do
    if [[ $file =~ ":" ]]
    then
        git add $file
    fi
done

git add k8s
git add *.md
git add *.sh
git commit -m dev
git push
