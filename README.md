
coffeescript testing of:

https://github.com/feross/buffer

In the test directory run the command:

```
alias ccc='rm *.js; coffee -c *'
```

Then you can run mocha on any individual test.

Or go up one directory and just type **mocha**

And it will run all of the tests in the test directory.

### Transforms

##### Uint8Array -> Buffer

To go from a Uint8Array to a buffer see 11.utils.coffee
and this is the idea...

```
ab = new Uint8Array([0..255])
check = (at) -> at[r].should.equal(r) for r in [0..255]
check(ab)
str1 = new Buffer(ab).toString()
```

Note you are passing the Uint8Array into the constructor of the Buffer
and then calling **toString() to get back out a string.

##### Buffer -> Uint8Array

see basic.coffee for an example

still working this out...
