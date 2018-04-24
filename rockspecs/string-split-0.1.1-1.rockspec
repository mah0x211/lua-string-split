package = "string-split"
version = "0.1.1-1"
source = {
    url = "git://github.com/mah0x211/lua-string-split.git",
    tag = "v0.1.1"
}
description = {
    summary = "split a string into an array of substrings.",
    homepage = "https://github.com/mah0x211/lua-string-split",
    license = "MIT/X11",
    maintainer = "Masatoshi Teruya"
}
dependencies = {
    "lua >= 5.1",
}
build = {
    type = "builtin",
    modules = {
        ["string.split"] = "split.lua"
    }
}

