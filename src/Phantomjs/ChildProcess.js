"use strict"

// module Phantomjs.ChildProcess

exports.spawn = function (command) {
  return function (args) {
    return function () {
      return require('child_process').spawn(command, args)
    }
  }
}
