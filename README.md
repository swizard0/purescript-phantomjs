# purescript-phantomjs

Write your [Phantomjs](http://phantomjs.org/) scripts with PureScript!


<!-- # Example -->

<!-- Let's take a screenshot of Hacker News: -->

<!-- ``` purescript -->
<!-- main = do -->
<!--   page <- createPage -->
<!--   launchAff do -->
<!--     response <- open page "http://news.ycombinator.com" -->
<!--     liftEff $ handleResponse response page -->

<!-- handleResponse response page = -->
<!--   if response /= "success" -->
<!--   then do -->
<!--     log "Error: couldn't connect." -->
<!--     shutdown 0 -->
<!--   else do -->
<!--     takeScreenshot page -->

<!-- takeScreenshot page = do -->
<!--   setClipRect page $ Rect { top: 10, left: 35, width: 330, height: 500 } -->
<!--   render page "hackernews.jpg" -->
<!--   log "Success: screen captured." -->
<!--   shutdown 0 -->
<!-- ``` -->

<!-- Not bad! -->


See the [examples directory](/examples/) for more examples.


# Getting Started

## Installation

```
npm install -g purescript
```
```
npm install -g pulp
```
```
brew install phantomjs
```
(Or the equivalent on your machine.)

Make a new directory and initialize a new project:

```
mkdir my-purescript-phantomjs-test
cd my-purescript-phantomjs-test
pulp init
```

Now install the library:

```
pulp dep i purescript-phantomjs
```

## Introduction and Usage

This library provides PureScript bindings to the Phantomjs API. You can use it to compile JS scripts that can be executed by the `phantomjs` command.

For example, to compile a script that takes a screenshot of the Yahoo homepage, run the following command in this project's root directory:

```
pulp build --include test --main Test.Main --to phantom-script.js
```

and then executed it with:
```
phantomjs phantom-script.js http://yahoo.com
```

# API Docs

For more documentation, see the [docs directory](/docs/).

# Contribute

If you have any issues or possible improvements please file them as GitHub Issues. Pull requests are encouraged.

# License

MIT License
