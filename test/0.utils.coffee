chai = require 'chai'
chai.should()
require('./utils')

describe 'Utils functions', ->
  it 'ArrayBuffer to/from base64: ', ->
    ab = new Uint8Array([0..255])
    check = (at) -> at[r].should.equal(r) for r in [0..255]
    check(ab)
    s = ab.toBase64()
    ab2 = s.fromBase64()
    check(ab2)
    ab.length.should.equal(ab2.length)
