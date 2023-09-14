local CurrentPage = PageNames[props["page_index"].Value]

local text_font_size = 10
local subheading_font_size = 14
local heading_font_size = 18
local standard_corner_radius = 0
local standard_indicator_margin = 2
local btn_size = {64, 24}
local row_size = 4
local logo_area_height = 3 * btn_size[2]
local logo_size = {1.5 * btn_size[1], 0.625 * 1.5 * btn_size[1]}
local setup_groupbox_size = {6 * btn_size[1], 4 * btn_size[2]}
local setup_groupbox_position = {0, logo_area_height}
local control_groupbox_size = {
  setup_groupbox_size[1],
  btn_size[2] + (btn_size[2]) * (math.floor((#ButtonNames - 1) / row_size) + 1)
}
local control_groupbox_position = {0, setup_groupbox_position[2] + setup_groupbox_size[2]}

if CurrentPage == "Control" then
  table.insert(
    graphics,
    {
      Type = "GroupBox",
      Fill = Colors.White,
      StrokeWidth = 0,
      CornerRadius = 0,
      Position = {0, 0},
      Size = {setup_groupbox_size[1], logo_area_height}
    }
  )
  table.insert(
    graphics,
    {
      Type = "Image",
      Image = logo,
      Position = {(setup_groupbox_size[1] / 2) - (logo_size[1] / 2), (logo_area_height - logo_size[2]) / 2},
      Size = logo_size
    }
  )
  table.insert(
    graphics,
    {
      Type = "GroupBox",
      Fill = Colors.White,
      StrokeWidth = 0,
      CornerRadius = 0,
      Position = setup_groupbox_position,
      Size = setup_groupbox_size
    }
  )
  table.insert(
    graphics,
    {
      Type = "Header",
      Text = "Setup",
      Color = Colors.Black,
      FontSize = heading_font_size,
      FontStyle = "Bold",
      Position = {setup_groupbox_position[1] + (1 * btn_size[1]), setup_groupbox_position[2]},
      Size = {setup_groupbox_size[1] - (2 * btn_size[1]), btn_size[2]},
      HTextAlign = "Center"
    }
  )
  table.insert(
    graphics,
    {
      Type = "Text",
      Text = "IP Address:",
      Color = Colors.Black,
      FontSize = subheading_font_size,
      FontStyle = "Regular",
      Position = {setup_groupbox_position[1] + (1 * btn_size[1]), setup_groupbox_position[2] + (1 * btn_size[2])},
      Size = {2 * btn_size[1], btn_size[2]},
      HTextAlign = "Right"
    }
  )
  layout["IPAddress"] = {
    PrettyName = "Online",
    Style = "Indicator",
    Margin = standard_indicator_margin,
    Position = {setup_groupbox_position[1] + (3 * btn_size[1]), setup_groupbox_position[2] + (1 * btn_size[2])},
    Size = {2 * btn_size[1], btn_size[2]}
  }
  table.insert(
    graphics,
    {
      Type = "Text",
      Text = "Status:",
      Color = Colors.Black,
      FontSize = subheading_font_size,
      FontStyle = "Regular",
      Position = {setup_groupbox_position[1] + (1 * btn_size[1]), setup_groupbox_position[2] + (2 * btn_size[2])},
      Size = {2 * btn_size[1], btn_size[2]},
      HTextAlign = "Right"
    }
  )
  layout["Status"] = {
    PrettyName = "Connection State",
    Style = "Text",
    HTextAlign = "Center",
    Margin = standard_indicator_margin,
    StrokeWidth = 0,
    Position = {setup_groupbox_position[1] + (3 * btn_size[1]), setup_groupbox_position[2] + (2 * btn_size[2])},
    Size = {2 * btn_size[1], btn_size[2]}
  }
  table.insert(
    graphics,
    {
      Type = "GroupBox",
      Fill = Colors.White,
      StrokeWidth = 0,
      CornerRadius = 0,
      Position = control_groupbox_position,
      Size = control_groupbox_size
    }
  )
  table.insert(
    graphics,
    {
      Type = "Header",
      Text = "Remote Control",
      Color = Colors.Black,
      FontSize = heading_font_size,
      FontStyle = "Bold",
      Position = {control_groupbox_position[1] + (1 * btn_size[1]), control_groupbox_position[2]},
      Size = {control_groupbox_size[1] - (2 * btn_size[1]), btn_size[2]},
      HTextAlign = "Center"
    }
  )
  for i, control in ipairs(ButtonNames) do
    local row = math.floor((i - 1) / row_size) + 1
    local column = i - (row - 1) * row_size
    layout["RemoteButton" .. control] = {
      PrettyName = "Remote~" .. control,
      Legend = control,
      Style = "Button",
      ButtonStyle = "Trigger",
      Position = {
        control_groupbox_position[1] + (control_groupbox_size[1] / 2) - (btn_size[1] * row_size / 2) +
          (btn_size[1] * (column - 1)),
        control_groupbox_position[2] + (btn_size[2] * row)
      },
      Size = btn_size
    }
  end
end
