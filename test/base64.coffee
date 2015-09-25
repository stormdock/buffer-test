if process.env.OBJECT_IMPL
  global.TYPED_ARRAY_SUPPORT = false
B = require('buffer/').Buffer
test = require('tape')
test 'base64: ignore whitespace', (t) ->
  text = '\n   YW9ldQ==  '
  buf = new B(text, 'base64')
  t.equal buf.toString(), 'aoeu'
  t.end()
  return
test 'base64: strings without padding', (t) ->
  t.equal new B('YW9ldQ', 'base64').toString(), 'aoeu'
  t.end()
  return
test 'base64: newline in utf8 -- should not be an issue', (t) ->
  t.equal new B('LS0tCnRpdGxlOiBUaHJlZSBkYXNoZXMgbWFya3MgdGhlIHNwb3QKdGFnczoK', 'base64').toString('utf8'), '---\ntitle: Three dashes marks the spot\ntags:\n'
  t.end()
  return
test 'base64: newline in base64 -- should get stripped', (t) ->
  t.equal new B('LS0tCnRpdGxlOiBUaHJlZSBkYXNoZXMgbWFya3MgdGhlIHNwb3QKdGFnczoK\nICAtIHlhbWwKICAtIGZyb250LW1hdHRlcgogIC0gZGFzaGVzCmV4cGFuZWQt', 'base64').toString('utf8'), '---\ntitle: Three dashes marks the spot\ntags:\n  - yaml\n  - front-matter\n  - dashes\nexpaned-'
  t.end()
  return
