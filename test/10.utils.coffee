chai = require 'chai'
chai.should()
Buffer = require('buffer/').Buffer

describe 'Utils functions', ->
  it 'hello world to/from base64: ', ->
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
