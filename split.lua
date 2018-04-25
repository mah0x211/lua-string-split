--[[

  Copyright (C) 2018 Masatoshi Teruya

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.

  split.lua
  lua-string-split
  Created by Masatoshi Teruya on 18/04/25.

--]]
--- file-scope variables
local type = type;
local error = error;
local strsub = string.sub;
local strfind = string.find;
--- constants
local INF_POS = math.huge;
local INF_NEG = -INF_POS;


--- isFinite
-- @param arg
-- @return ok
local function isFinite( arg )
    return type( arg ) == 'number' and ( arg < INF_POS and arg > INF_NEG );
end


--- split
-- @param str
-- @param sep
-- @param limit
-- @param plain
-- @return arr
local function split( str, sep, limit, plain )
    if type( str ) ~= 'string' then
        error( 'str must be string', 2 );
    elseif sep ~= nil and type( sep ) ~= 'string' then
        error( 'sep must be string', 2 );
    elseif limit ~= nil and not isFinite( limit ) then
        error( 'limit must be finite-integer', 2 );
    elseif plain ~= nil and type( plain ) ~= 'boolean' then
        error( 'plain must be boolean', 2 );
    -- empty-string
    elseif str == '' then
        return { '' };
    elseif sep == nil then
        return { str };
    elseif sep == '' then
        local arr = {};

        if limit then
            for i = 1, #str do
                if i > limit then
                    arr[i] = strsub( str, i );
                    return arr;
                end

                arr[i] = strsub( str, i, i );
            end

            return arr;
        end

        for i = 1, #str do
            arr[i] = strsub( str, i, i );
        end

        return arr;
    else
        local arr = {};
        local idx = 1;
        local pos = 0;
        local head, tail = strfind( str, sep, pos, plain );

        if limit then
            while head do
                if idx > limit then
                    break
                end

                arr[idx] = strsub( str, pos, head - 1 );
                idx = idx + 1;
                pos = tail + 1;
                head, tail = strfind( str, sep, pos, plain );
            end
        else
            while head do
                arr[idx] = strsub( str, pos, head - 1 );
                idx = idx + 1;
                pos = tail + 1;
                head, tail = strfind( str, sep, pos, plain );
            end
        end

        if pos <= #str then
            arr[idx] = strsub( str, pos );
        end

        return arr;
    end
end

return split

