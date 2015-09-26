chai = require 'chai'
chai.should()
Buffer = require('buffer/').Buffer

describe 'Utils functions', ->
  it 'ArrayBuffer to/from base64: ', ->
    ab = new Uint8Array([0..255])
    check = (at) -> at[r].should.equal(r) for r in [0..255]
    check(ab)

    buf1 = new Buffer(ab)
    ab1 = new Uint8Array(buf1)
    check(ab1)
