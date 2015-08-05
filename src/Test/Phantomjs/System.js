"use strict"

// module Test.Phantomjs.System

exports.args = function () {
  return require('system').args
}

exports.env = function () {
  return require('system').env
}

exports.os = function () {
  return require('system').os
}

exports.pid = function () {
  return require('system').pid
}

exports.platform = function () {
  return require('system').platform
}
