chai = require 'chai'
chai.should()
Buffer = require('buffer/').Buffer

describe 'Utils functions', ->
  it 'ArrayBuffer to/from base64: ', ->
    ab = new Uint8Array([0..255])
    check = (at) -> at[r].should.equal(r) for r in [0..255]
    check(ab)

    str1 = new Buffer(ab).toString()

    # btoa
    bufhw = new Buffer(str1, 'binary')
    b64 = bufhw.toString 'base64'

    # atob
    buf2 = new Buffer(b64, 'base64')
    str2 = buf2.toString()
    str2.should.equal(str1)
