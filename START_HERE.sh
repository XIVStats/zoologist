#!/bin/sh
read -p 'Username: ' uservar
read -p 'Repo: ' repo
echo "Deleting node_modules temporarily"
rm -rf node_modules
echo "Initiating replacement"
find . -type f -name "*.md" -print0 | xargs -0 sed -i '' -e 's/${OWNER}/'$uservar'/g'
find . -type f -name "*.md" -print0 | xargs -0 sed -i '' -e 's/${REPO}/'$repo'/g'
find . -type f -name "*.json" -print0 | xargs -0 sed -i '' -e 's/${OWNER}/'$uservar'/g'
find . -type f -name "*.json" -print0 | xargs -0 sed -i '' -e 's/${REPO}/'$repo'/g'
echo "Done replacing, installing modules"
npm i
git add --all
git commit -m "chore: init repo"
rm START_HERE.sh
