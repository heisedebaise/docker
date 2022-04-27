#!/bin/bash

for file in `ls | grep ':'`; do
    git add $file
done

git add k8s
git add *.md
git add *.sh
git commit -m dev
git push
git push github