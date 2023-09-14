local length = 0
local button = 0
local buffer = ''

local ip_pattern = "[012]?%d?%d+%.[012]?%d?%d+%.[012]?%d?%d+%.[012]?%d?%d"
local port = 49160

local SkySNAPIList = {
  ["Play"]= 064, --01	Play
  ["Stop"]=066, --02	Stop
  ["Pause"]=065, --03	Pause
  ["Next"]=999, --04	Next
  ["Previous"]=999, --05	Previous
  ["Ffwd"]=069, --06	Search Fwd
  ["Rew"]=071, --07	Search Rev
  ["Record"]=067, --08	Record
  ["Power"]=000, --09	Power
  ["Key 0"]=048, --10	Keypad 0
  ["Key 1"]=049, --11	Keypad 1
  ["Key 2"]=050, --12	Keypad 2
  ["Key 3"]=051, --13	Keypad 3
  ["Key 4"]=052, --14	Keypad 4
  ["Key 5"]=053, --15	Keypad 5
  ["Key 6"]=054, --16	Keypad 6
  ["Key 7"]=055, --17	Keypad 7
  ["Key 8"]=056, --18	Keypad 8
  ["Key 9"]=057, --19	Keypad 9
  --999,
  --999,
  ["Chan +"]=006, --22	Channel Up
  ["Chan -"]= 007, --23	Channel Down
  --999,
  --999,
  --999,
  ["Power On"]=0, --27	Power On
  ["Power Off"]=0, --28	Power Off
 -- 999,
  --999,
  ["Home"]=011, --31	Home (Q)
  ["Sky"]=241, --32	Sky
  ["Services"]=010, --33	Services
  ["Sidebar"]=008, --34	Sidebar (Q)
  --999,
  --999,
  --999,
  --999,
  ["Info"]=014, --39	Info
  --999,
  --999,
  --999,
  --999,
  ["EPG"]=011, --44	EPG (HD)
  ["Up"]=016, --45	Up
  ["Down"]=017, --46	Down
  ["Left"]=018, --47	Left
  ["Right"]=019, --48	Right
  ["OK"]=001, --49	OK
  ["Back"]=002, --50	Back
  ["Red"]=032, --51	Red
  ["Green"]=033, --52	Green
  ["Yellow"]=034, --53	Yellow
  ["Blue"]=035 --54	Blue
}
