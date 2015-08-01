'use strict'

// module Test.BrowserProcs

// retrieve the browser's document title
exports.docTitle = function () { return document.title }

// set a variable in the browser
exports.setIntX = function (x) {
  window.browser_x = x
}

// get a variable in the browser
exports.getIntX = function () {
  return window.browser_x
}

// only makes sense after having set x with a previous proc
exports.addYandZtoX = function (y,z) {
  return window.browser_x + y + z
}
