local Colors = {
  transparent = {0, 0, 0, 0},
  almost_transparent = {0, 0, 0, 20},
  White = {255, 255, 255},
  Black = {0, 0, 0},
  Red = {255, 0, 0},
  Green = {0, 153, 51},
  Blue = {0, 0, 255},
  Orange = {255, 204, 119}
}

-- just to keep the order in layout
local ButtonNames = {
  "Play",
  "Stop",
  "Pause",
  --"Next",
  --"Previous",
  "Ffwd",
  "Rew",
  "Record",
  "Power",
  "Key 0",
  "Key 1",
  "Key 2",
  "Key 3",
  "Key 4",
  "Key 5",
  "Key 6",
  "Key 7",
  "Key 8",
  "Key 9",
  --"",
  --"",
  "Chan +",
  "Chan -",
  --"",
  --"",
  --"",
  "Power On",
  "Power Off",
  --"",
  --"",
  "Home",
  "Sky",
  "Services",
  "Sidebar",
  --"",
  --"",
  --"",
  --"",
  "Info",
  --"",
  --"",
  --"",
  --"",
  "EPG",
  "Up",
  "Down",
  "Left",
  "Right",
  "OK",
  "Back",
  "Red",
  "Green",
  "Yellow",
  "Blue"
}

local SkySNAPIList = {
  ["Play"] = 064, --01	Play
  ["Stop"] = 066, --02	Stop
  ["Pause"] = 065, --03	Pause
  --["Next"]=999, --04	Next
  --["Previous"]=999, --05	Previous
  ["Ffwd"] = 069, --06	Search Fwd
  ["Rew"] = 071, --07	Search Rev
  ["Record"] = 067, --08	Record
  ["Power"] = 000, --09	Power
  ["Key 0"] = 048, --10	Keypad 0
  ["Key 1"] = 049, --11	Keypad 1
  ["Key 2"] = 050, --12	Keypad 2
  ["Key 3"] = 051, --13	Keypad 3
  ["Key 4"] = 052, --14	Keypad 4
  ["Key 5"] = 053, --15	Keypad 5
  ["Key 6"] = 054, --16	Keypad 6
  ["Key 7"] = 055, --17	Keypad 7
  ["Key 8"] = 056, --18	Keypad 8
  ["Key 9"] = 057, --19	Keypad 9
  --999,
  --999,
  ["Chan +"] = 006, --22	Channel Up
  ["Chan -"] = 007, --23	Channel Down
  --999,
  --999,
  --999,
  ["Power On"] = 0, --27	Power On
  ["Power Off"] = 0, --28	Power Off
  -- 999,
  --999,
  ["Home"] = 011, --31	Home (Q)
  ["Sky"] = 241, --32	Sky
  ["Services"] = 010, --33	Services
  ["Sidebar"] = 008, --34	Sidebar (Q)
  --999,
  --999,
  --999,
  --999,
  ["Info"] = 014, --39	Info
  --999,
  --999,
  --999,
  --999,
  ["EPG"] = 011, --44	EPG (HD)
  ["Up"] = 016, --45	Up
  ["Down"] = 017, --46	Down
  ["Left"] = 018, --47	Left
  ["Right"] = 019, --48	Right
  ["OK"] = 001, --49	OK
  ["Back"] = 002, --50	Back
  ["Red"] = 032, --51	Red
  ["Green"] = 033, --52	Green
  ["Yellow"] = 034, --53	Yellow
  ["Blue"] = 035 --54	Blue
}

logo =
  "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"
