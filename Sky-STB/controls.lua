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
for control, _ in pairs(SkySNAPIList) do
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
