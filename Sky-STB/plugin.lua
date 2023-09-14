--[[ #include "info.lua" ]]
--[[ #include "const_variables.lua" ]]
-- Define the color of the plugin object in the design
function GetColor(props)
  return {102, 102, 102}
end

-- The name that will initially display when dragged into a design
function GetPrettyName(props)
  return "Sky STB " .. PluginInfo.Version
end

-- Optional function used if plugin has multiple pages
PageNames = {"Control"} --List the pages within the plugin
function GetPages(props)
  local pages = {}
  --[[ #include "pages.lua" ]]
  return pages
end

-- Define User configurable Properties of the plugin
function GetProperties()
  local props = {}
  --[[ #include "properties.lua" ]]
  return props
end

-- Optional function to update available properties when properties are altered by the user
function RectifyProperties(props)
  --[[ #include "rectify_properties.lua" ]]
  return props
end

-- Defines the Controls used within the plugin
function GetControls(props)
  local ctrls = {}
  --[[ #include "controls.lua" ]]
  return ctrls
end

--Layout of controls and graphics for the plugin UI to display
function GetControlLayout(props)
  local layout = {}
  local graphics = {}
  --[[ #include "layout.lua" ]]
  return layout, graphics
end

--Start event based logic
if Controls then
--[[ #include "runtime_variables.lua" ]]
--[[ #include "runtime.lua" ]]
end
