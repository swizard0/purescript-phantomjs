"use strict"

// module Test.Phantomjs.Object

exports.addCookie = function (cookie) {
  return function () {
    return phantom.addCookie(cookie)
  }
}

exports.clearCookies = function () {
  return phantom.clearCookies()
}

exports.getCookies = function () {
  return phantom.cookies
}

exports.setCookies = function (v) {
  return function () {
    return phantom.cookies = v
  }
}

exports.getCookiesEnabled = function () {
  return phantom.cookiesEnabled
}

exports.setCookiesEnabled = function (v) {
  return function () {
    return phantom.cookiesEnabled = v
  }
}

exports.deleteCookie = function (key) {
  return function () {
    return phantom.deleteCookie(key)
  }
}

exports.exit = function (exitCode) {
  return function () {
    return phantom.exit(exitCode)
  }
}

exports.getLibraryPath = function () {
  return phantom.libraryPath
}

exports.setLibraryPath = function (path) {
  return function () {
    return phantom.libraryPath = path
  }
}

exports.version = function () {
  return phantom.version
}
