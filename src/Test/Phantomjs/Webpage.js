"use strict"

// module Test.Phantomjs.Webpage

exports.create = function () {
  return require('webpage').create()
}

exports.evaluate0 = function (page) {
  return function (proc) {
    return function () {
      return page.evaluate(eval(proc))
    }
  }
}

exports._open = function (onError) {
  return function (onSuccess) {
    return function (page) {
      return function (url) {
        return function () {
          page.open(url, function (status) {
            if (status === 'success') onSuccess()
            else onError(new Error("Connection failure"))()
          })
        }
      }
    }
  }
}

exports.render = function (page) {
  return function (file) {
    return function () {
      page.render(file)
    }
  }
}
