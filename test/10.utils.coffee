chai = require 'chai'
chai.should()
require('./utils')
Buffer = require('buffer/').Buffer

describe 'Utils functions', ->
  it 'ArrayBuffer to/from base64: ', ->
    ab = new Uint8Array([0..255])
    check = (at) -> at[r].should.equal(r) for r in [0..255]
    check(ab)
    str1 = new Buffer(ab, 'base64').toString()
    str2 = new Buffer(str1, 'base64').toString()
    console.log(str2)

    b64 = "SGVsbG8gV29ybGQ="
    strhw = "Hello World"

    # btoa
    bufhw = new Buffer(strhw, 'binary')
    b64x = bufhw.toString 'base64'
    b64x.should.equal(b64)
    console.log(b64x)

    # atob
    hw = new Buffer(b64, 'base64').toString()
    hw.should.equal(strhw)
    console.log(hw)
