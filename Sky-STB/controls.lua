table.insert(
  ctrls,
  {
    Name = "IPAddress",
    ControlType = "Text",
    UserPin = true,
    PinStyle = "Both"
  }
)
table.insert(
  ctrls,
  {
    Name = "Status",
    ControlType = "Indicator",
    IndicatorType = Reflect and "StatusGP" or "Status",
    PinStyle = "Output",
    UserPin = true
  }
)
for _, control in ipairs(ButtonNames) do
  if control ~= "" then
    table.insert(
      ctrls,
      {
        Name = "RemoteButton" .. control,
        ControlType = "Button",
        ButtonType = "Trigger",
        UserPin = true,
        PinStyle = "Both"
      }
    )
  end
end
