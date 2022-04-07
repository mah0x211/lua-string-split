# lua-string-split

[![test](https://github.com/mah0x211/lua-string-split/actions/workflows/test.yml/badge.svg)](https://github.com/mah0x211/lua-string-split/actions/workflows/test.yml)
[![codecov](https://codecov.io/gh/mah0x211/lua-string-split/branch/master/graph/badge.svg)](https://codecov.io/gh/mah0x211/lua-string-split)


split a string into an array of substrings.


## Installation

```sh
luarocks install string-split
```

---


## arr = split( s, sep [, limit [, plain]] )

splits `s` by `sep` and returns an array of its substrings.

**Params**

- `s:string`: string
- `sep:string`: seperator pattern string
- `limit:number`: splits `s` up to `limit` times
- `plain:boolean`: if `true`, the `sep` will be used as a plain string

**Returns**

- `arr:table`: an array of substrings



## arr = split.after( s, sep [, limit [, plain]] )

splits `s` after a `sep` and returns an array of its substrings.

**Params**

- `s:string`: string
- `sep:string`: seperator pattern string
- `limit:number`: splits `s` up to `limit` times
- `plain:boolean`: if `true`, the `sep` will be used as a plain string

**Returns**

- `arr:table`: an array of substrings


## arr = split.fields( s )

splits `s` around each whitespace and returns an array of substrings.

**Params**

- `s:string`: string

**Returns**

- `arr:table`: an array of substrings



## Usage

```lua
local split = require('string.split')
-- you must install dump module from https://github.com/mah0x211/lua-dump
-- or luarocks install dump
local dump = require('dump')

print(dump(split(':foo::bar:::baz', '')))
-- {
--     [1] = ":",
--     [2] = "f",
--     [3] = "o",
--     [4] = "o",
--     [5] = ":",
--     [6] = ":",
--     [7] = "b",
--     [8] = "a",
--     [9] = "r",
--     [10] = ":",
--     [11] = ":",
--     [12] = ":",
--     [13] = "b",
--     [14] = "a",
--     [15] = "z"
-- }

print(dump(split(':foo::bar:::baz', ':')))
-- {
--     [1] = "",
--     [2] = "foo",
--     [3] = "",
--     [4] = "bar",
--     [5] = "",
--     [6] = "",
--     [7] = "baz"
-- }

print(dump(split(':foo::bar:::baz', ':+')))
-- {
--     [1] = "",
--     [2] = "foo",
--     [3] = "bar",
--     [4] = "baz"
-- }

print(dump(split.after('foo/bar//baz/qux', '/+')))
-- {
--     [1] = "foo/",
--     [2] = "bar//",
--     [3] = "baz/",
--     [4] = "qux"
-- }

print(dump(split.fields('  foo \nbar \t    \n  baz')))
-- {
--     [1] = "foo",
--     [2] = "bar",
--     [3] = "baz"
-- }
```
