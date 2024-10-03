#!/usr/bin/env bash

echo "$TOKEN" > ~/.ssh/id_rsa.pub

git config --global user.email "CI@DUMBSPACEDOG.DEPLOYNEXTJS.ACTION"
git config --global user.name "Github Actions"

# Build the project
if [ -z "$USEYARN" ] then
    npm install
    npm run build
    npm run export
else
    yarn install
    yarn build
    yarn export
fi



mv out /tmp/out
cd /tmp/out

# Push the build to the gh-pages branch
git init
git add .
git commit -m "Deploy to Github Pages via Deploy Action"
git push --force --quiet "ssh://$USERNAME@github.com/$REPONAME.git" master:gh-pages