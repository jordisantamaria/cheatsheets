# Programming Cheat-sheets

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](#)
[![Twitter: JordiSantamar1a](https://img.shields.io/twitter/follow/JordiSantamar1a.svg?style=social)](https://twitter.com/JordiSantamar1a)

website: [website](https://jordisantamaria.github.io/cheatsheets/)

Source code: https://github.com/jordisantamaria/cheatsheets

# Nomenclature

```
[variable]     # Obligatory variable
{variable}     # Optional variable
```

# How to collaborate

1. Create a folder with a topic, and a .md file
2. Update Summary.md to include the topic in the menu
3. Create a PR with a custom branch.

# For update styles of webpage.

Styles can be updated, using the class and tags generated by gitbook
updating the styles/website.css file.

# For deploy to GitHub pages

```
bash deploy.sh
```

# Run website in local

```
yarn serve
```

# How to develop a Gitbook

## Start point

Start point: readme.md

## Summary

Book structure index: summary.md

* [section 1](section1/README.md)
  * [example 1](section1/example1.md)
  * [example 2](section1/example2.md)
* [section 2](section2/README.md)
  * [example 1](section2/example1.md)

## GLOSSARY

GLOSSARY.md
Define terms and definitions

##Variables
 
book.json
 ```json
 {
  "variables": {
    "website": "https://jordiviva.github.io/learn-docker/"
  }
 }
 ```

Use:
`{ { book.website } }`

## Reference to other files

 ```{ % include "./test.md" % } ```

## Install new plugins

Add plugins to book.json:
```
"plugins": ["autocover"],
```

Then install with:

```
gitbook install
```
