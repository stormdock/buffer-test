
class Utils

  @atob = (str) ->
    new Buffer(str, 'base64').toString 'binary'

  @btoa = (str) ->
    if str instanceof Buffer
      buffer = str
    else
      buffer = new Buffer(str.toString(), 'binary')
    buffer.toString 'base64'

  # --- Mixins ---
  @extend = (obj, mixin, block) ->
    for own key, value of mixin
      unless block
        obj[key] = value
      else
        block.call(obj,key,value)
    obj

  @include = (klass, mixin) ->
    @extend klass.prototype, mixin

  @type = (obj) ->
    return 'undefined' if obj == undefined
    return 'null' if obj == null
    Object.prototype.toString.call(obj).replace("[",'').replace("]",'').split(' ')[1]

  @expose: (lib)->
    (v for own k,v of lib)

  @ajaxCall: (stdParams,custom) ->
    return $.ajax(Utils.extend stdParams,custom)

# --- String class mixin ---
Utils.include String,
  # string to array of byte values
  toCodeArray: ->
    (s.charCodeAt() for s in @)

  # UTF8 conversions
  toUTF8: ->
    unescape encodeURIComponent @
  fromUTF8: ->
    decodeURIComponent escape @

  # Each char code to Uint8Array
  toUint8Array: ->
    new Uint8Array @.toUTF8().toCodeArray()

  toUint8ArrayRaw: ->
    new Uint8Array @.toCodeArray()

  # From base64 string to Uint8Array
  fromBase64: ->
    new Uint8Array (@atob @).toCodeArray()

  # Trim line feed chars
  trimLines: ->
    @.replace("\r\n",'').replace('\n','').replace('\r','')

# --- Array classes mixins ---
for C in [ Array , Uint8Array , Uint16Array ]
  Utils.include C,
    # From JS arrays of char codes to a string
    # UTF16 chars above ASCII will generate codes above 255
    fromCharCodes: ->
      (String.fromCharCode(c) for c in @).join('')

    # From array of char codes to base64 string
    toBase64: ->
      @btoa @fromCharCodes()

    xorWith: (a) ->
      return null unless @.length == a.length
      new Uint8Array(c^a[i] for c,i in @)

# --- end mixins ---

module.exports = Utils
