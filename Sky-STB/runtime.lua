local Sky

Sky = TcpSocket.New()
Sky.ReadTimeout = 0
Sky.WriteTimeout = 0
Sky.ReconnectTimeout = 0

function IsConnected()
  return Sky.IsConnected
end

function fnCloseSocket()
  Sky:Disconnect()
end

function fnCheckConnection()
  if not IsConnected() then
    if string.find(Controls.IPAddress.String, ip_pattern) then
      Controls.Status.Value = 5
      Sky:Connect(Controls.IPAddress.String, port)
    else
      Controls.Status.Value = 2
    end
  end
end

-- EventHandler
Sky.EventHandler = function(Sky, evt, err)
  if evt == TcpSocket.Events.Connected then
    print("socket connected")
    Controls.Status.Value = 0
    length = 12
    buffer = ""
  elseif evt == TcpSocket.Events.Data then
    local returndata = ""
    line = Sky:Read(Sky.BufferLength)
    buffer = buffer .. line
    if string.len(buffer) < 24 then
      returndata = string.sub(line, 1, length)
      Sky:Write(returndata)
      length = 1
    else
      --cmd1 = string.char(4, 1, 0, 0, 0, 0, math.floor(224 + button / 16), button % 16)
      --cmd2 = string.char(4, 0, 0, 0, 0, 0, math.floor(224 + button / 16), button % 16)
      processed_cmd = string.char(math.floor(224 + (button / 16))) .. string.char((button % 16))
      print(processed_cmd)
      cmd1 = "\x04\x01\x00\x00\x00\x00" .. processed_cmd
      cmd2 = "\x04\x00\x00\x00\x00\x00" .. processed_cmd
      Sky:Write(cmd1)
      Sky:Write(cmd2)
      Timer.CallAfter(fnCloseSocket, 0.05)
    end
  elseif evt == TcpSocket.Events.Closed then
    print("socket closed by remote")
    fnCloseSocket()
    Controls.Status.Value = 2
  elseif evt == TcpSocket.Events.Error then
    print("socket closed due to error", err)
    fnCloseSocket()
    Controls.Status.Value = 2
  elseif evt == TcpSocket.Events.Timeout then
    print("socket closed due to timeout")
    fnCloseSocket()
    Controls.Status.Value = 2
  else
    print("unknown socket event", evt) --should never happen
    fnCloseSocket()
  end
end

Controls.IPAddress.EventHandler = function(ctl)
  --
end

for i = 1, #ButtonNames do
  if ButtonNames[i] ~= "" then
    print(ButtonNames[i], SkySNAPIList[ButtonNames[i]])
    Controls["RemoteButton" .. ButtonNames[i]].EventHandler = function(ctl)
      button = SkySNAPIList[ButtonNames[i]]
      fnCheckConnection()
    end
  end
end