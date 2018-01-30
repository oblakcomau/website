#!/bin/bash -e

jekyll -v || bundle install
wd=$(pwd)
if [ -d ../site ]; then
  jekyll b -d ../site/
  cd ../site
  git status
  echo "please run cd ../site && git commit -a -m \"update on \`date\`\" && git push origin master"
else
  cd ..
  git clone git@github.com:oblakcomau/site.git
  cd $wd
  jekyll b -d ../site/
  cd ../site
  git diff
  echo "please run cd ../site && git commit -a -m \"update on \`date\`\" && git push origin master"
fi
