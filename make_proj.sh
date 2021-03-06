#!/bin/sh

if [ "$#" -ne 1 ]
then
  echo "Usage: ./make_proj.sh <project name>"
  exit 1
fi

PROJ=$1

rm -rf .git
find . -type f ! -iname "make_proj.sh" -exec sed -i "s/pystub/$PROJ/g" {} \;
mv pystub $PROJ
git init
git add .
git reset make_proj.sh
git commit -am "initial commit"


