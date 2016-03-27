"use strict"

// module Phantomjs.Filesystem

exports.read = function (file) {
  return function () {
    return require('fs').read(file)
  }
}
