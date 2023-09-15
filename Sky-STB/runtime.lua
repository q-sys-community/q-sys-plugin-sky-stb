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
      if channel_select_command then
        for i=1, #Controls.ChannelSelect.String do
          local c = string.sub(Controls.ChannelSelect.String,i,i)
          Timer.CallAfter(
            function()
              button = c + 48
              processed_cmd = string.char(math.floor(224 + (button / 16))) .. string.char((button % 16))
              Sky:Write(btn_press .. processed_cmd)
              Sky:Write(btn_release .. processed_cmd)
            end,
            i*0.1
          )
        end
        Timer.CallAfter(fnCloseSocket, 1)
        channel_select_command = false
      else
        processed_cmd = string.char(math.floor(224 + (button / 16))) .. string.char((button % 16))
        Sky:Write(btn_press .. processed_cmd)
        Sky:Write(btn_release .. processed_cmd)
        Timer.CallAfter(fnCloseSocket, 0.05)
      end
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
    print("unknown socket event", evt)
    fnCloseSocket()
  end
end

function selectChannel()
  channel_select_command = true
  fnCheckConnection()
end

Controls.ChannelSelect.EventHandler = selectChannel

for control, value in pairs(SkySNAPIList) do
  Controls["RemoteButton" .. control].EventHandler = function()
    button = value
    fnCheckConnection()
  end
end
