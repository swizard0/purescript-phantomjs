"use strict"

// module Test.Phantomjs.Webpage

exports.create = function () {
  return require('webpage').create()
}

exports._getClipRect = function (page) {
  return function () {
    page.clipRect
    return {}
  }
}

exports._setClipRect = function (page,top,left,width,height) {
  return function () {
    page.clipRect = {
      top: top,
      left: left,
      width: width,
      height: height
    }
  }
}

exports.evaluate0 = function (page) {
  return function (proc) {
    return function () {
      return page.evaluate(eval(proc))
    }
  }
}

exports.evaluate1 = function (page) {
  return function (proc) {
    return function (_1) {
      return function () {
        return page.evaluate(eval(proc),_1)
      }
    }
  }
}

exports.evaluate2 = function (page) {
  return function (proc) {
    return function (_1) {
      return function (_2) {
        return function () {
          return page.evaluate(eval(proc),_1,_2)
        }
      }
    }
  }
}

exports.evaluate3 = function (page) {
  return function (proc) {
    return function (_1) {
      return function (_2) {
        return function (_3) {
          return function () {
            return page.evaluate(eval(proc),_1,_2,_3)
          }
        }
      }
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
