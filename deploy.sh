# install the plugins and build the static site
yarn install && yarn build

git checkout master
git pull

# for generate git pages, its required to push content to gh-pages branch
# checkout to the gh-pages branch
git checkout gh-pages

# pull the latest updates
git merge master gh-pages

# copy the static site files into the current directory.
cp -R _book/* .

# remove 'node_modules' and '_book' directory
git clean -fx node_modules
git clean -fx _book

# add all files
git add .

# commit
git commit -a -m "Update docs"

# push to the origin
git push origin gh-pages

# checkout to the master branch
git checkout master
