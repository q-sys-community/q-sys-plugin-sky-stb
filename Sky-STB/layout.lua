local CurrentPage = PageNames[props["page_index"].Value]
if CurrentPage == "Control" then
  local x, y = 0, 0
  -- Status Info Section
  layout["IPAddress"] = {
    PrettyName = "Online",
    Style = "Indicator",
    Color = {0, 255, 0},
    OffColor = {200, 0, 0},
    UnlinkOffColor = true,
    Position = {x + 3, y + 25},
    Size = {x + 25, y + 25}
  }
  layout["Status"] = {
    PrettyName = "Connection State",
    Style = "Text",
    HTextAlign = "Left",
    Padding = 5,
    StrokeWidth = 0,
    Position = {x + 35, y + 25},
    Size = {200, 25}
  }

  i, j = 0, 1
for _, control in ipairs(ButtonNames) do
    if control ~= "" then
      layout["RemoteButton" .. control] = {
        PrettyName = "Remote~" .. control,
        Legend = control,
        Style = "Button",
        ButtonStyle = "Trigger",
        Position = {x + 80 + (50 * i), y + 40 + (25 * j)},
        Size = {50, 25}
      }
      i = i + 1
      if i == 5 then
        i = 0
        j = j + 1
      end
    end
  end
end

  --[[for control, _ in pairs(SkySNAPIList) do
    layout["RemoteButton" .. control] = {
      PrettyName = "Remote~" .. control,
      Legend = control,
      Style = "Button",
      ButtonStyle = "Trigger",
      Position = {x + 80 + (50 * i), y + 40 + (25 * j)},
      Size = {50, 25}
    }
    i = i + 1
    if i == 5 then
      i = 0
      j = j + 1
    end
  end
end]]
