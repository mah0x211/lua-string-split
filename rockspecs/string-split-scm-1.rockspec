package = "string-split"
version = "scm-1"
source = {
    url = "git://github.com/mah0x211/lua-string-split.git"
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

