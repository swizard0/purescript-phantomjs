"use strict"

// module Test.Phantomjs.Filesystem

exports.read = function (file) {
  return function () {
    return require('fs').read(file)
  }
}
