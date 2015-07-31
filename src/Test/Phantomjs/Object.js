"use strict";

// module Test.Phantomjs.Object

exports.exit = function (exitCode) {
  return function () {
    return phantom.exit(exitCode)
  }
}
