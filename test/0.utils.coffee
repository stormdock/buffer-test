chai = require 'chai'
chai.should()
require('./utils')
Buffer = require('buffer/').Buffer
Utils = require('./utils')

describe 'Utils functions', ->
  it 'ArrayBuffer to/from base64: ', ->
    ab = new Uint8Array([0..255])
    check = (at) -> at[r].should.equal(r) for r in [0..255]
    check(ab)

    str1 = new Buffer(ab).toString()

    b64 = Utils.btoa(str1)
    str2 = Utils.atob(b64)
    str2.should.equal(str1)
