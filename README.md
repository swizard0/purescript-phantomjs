# purescript-phantomjs

Write your [Phantomjs](http://phantomjs.org/) scripts with [PureScript](http://www.purescript.org/)!

[![Build Status](https://travis-ci.org/cxfreeio/purescript-phantomjs.svg?branch=master)](https://travis-ci.org/cxfreeio/purescript-phantomjs)
[![License](http://img.shields.io/:license-MIT-blue.svg?style=flat)](LICENSE)


# Example

Let's take a quick screenshot of Hacker News:

``` purescript
main = do
  page <- create
  launchAff do
    open page "http://news.ycombinator.com"
    liftEff $ capture page

capture page = do
  setClipRect page $ Rect { top: 10, left: 35, width: 330, height: 500 }
  render page "hackernews.png"
  log "Success: screen captured."
  exit 0
```
In fact, once everything is installed, you can run this very example with:
``` shell
pulp build -I test -m YCombinatorExample -t hn.js && phantomjs hn.js
```

Not bad!

See the [test directory](/test/) for more examples.


# Getting Started

## Installation

``` shell
npm install -g purescript
npm install -g pulp
brew install phantomjs
```
(Or the equivalent on your machine.)

Make a new directory and initialize a new project:

``` shell
mkdir my-purescript-phantomjs-test
cd my-purescript-phantomjs-test
pulp init
```

Now install the library:

``` shell
pulp dep i purescript-phantomjs
```

## Introduction and Usage

This library provides PureScript bindings to the Phantomjs API. You can use it to compile JS scripts that can be executed using the `phantomjs` command.

For example, to compile a script that takes a screenshot of the Yahoo homepage, run the following command in this project's root directory:

``` shell
pulp build --include test --main Example --to take-screenshot.js
```

and then execute it with:
``` shell
phantomjs take-screenshot.js http://yahoo.com
```

# API Docs

For more documentation, see the [docs directory](/docs/).

# Contribute

If you have any issues or possible improvements please file them as GitHub Issues. Pull requests are encouraged.

# License

MIT License
