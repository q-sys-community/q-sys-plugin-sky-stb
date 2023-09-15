local length = 0
local button = 0
local buffer = ""

local ip_pattern = "[012]?%d?%d+%.[012]?%d?%d+%.[012]?%d?%d+%.[012]?%d?%d"
local port = 49160

btn_press = "\x04\x01\x00\x00\x00\x00"
btn_release = "\x04\x00\x00\x00\x00\x00"