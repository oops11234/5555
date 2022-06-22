#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'deploy'

git push -f https://github.com/oops11234/5555.git master:gh-pages

cd -