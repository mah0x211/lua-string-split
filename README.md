# lua-string-split

split a string into an array of substrings.

---

## Installation

```sh
luarocks install string-split --from=http://mah0x211.github.io/rocks/
```

## Function

### arr = split( str [, sep [, limit [, plain]]] )

returns an array of substrings.

**Parameters**

- `str:string`: string.
- `sep:string`: separator string.
- `limit:number`: limit on the number of splits.
- `plain:boolean`: turns off the pattern matching facilities if true.

**Returns**

- `arr:table`: an array of substrings.


## Usage

```lua
local split = require('string.split')
-- you must install dump module from https://github.com/mah0x211/lua-dump 
-- or luarocks install dump
local dump = require('dump') 


print( dump( split(':foo::bar:::baz') ) )
-- {
--     [1] = ":foo::bar:::baz"
-- }

print( dump( split(':foo::bar:::baz', '') ) )
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

print( dump( split(':foo::bar:::baz', ':') ) )
-- {
--     [1] = "",
--     [2] = "foo",
--     [3] = "",
--     [4] = "bar",
--     [5] = "",
--     [6] = "",
--     [7] = "baz"
-- }

print( dump( split(':foo::bar:::baz', ':+') ) )
-- {
--     [1] = "",
--     [2] = "foo",
--     [3] = "bar",
--     [4] = "baz"
-- }
```
