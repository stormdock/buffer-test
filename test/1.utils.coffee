chai = require 'chai'
chai.should()
Buffer = require('buffer/').Buffer
Utils = require('./utils')

describe 'Utils functions', ->
  it 'hello world to/from base64: ', ->
    b64 = "SGVsbG8gV29ybGQ="
    strhw = "Hello World"

    # btoa
    b64x = Utils.btoa(strhw)
    b64x.should.equal(b64)

    # atob
    hw = Utils.atob(b64)
    hw.should.equal(strhw)
