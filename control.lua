-- Set Evolution Function
function set_evolution()
  overrides = settings.startup
  map_settings = game.map_settings["enemy_evolution"]
  map_settings.time_factor = map_settings.time_factor * overrides["evocontrol-time-multiplier"].value
  map_settings.pollution_factor = map_settings.pollution_factor * overrides["evocontrol-pollution-multiplier"].value
  map_settings.destroy_factor = map_settings.destroy_factor * overrides["evocontrol-destroy-multiplier"].value
end
-- Add Commands
commands.add_command("evoctrl_multiplier", "get evolution multipliers", function(command)
  overrides = settings.startup
  time = "(Time: " .. overrides["evocontrol-time-multiplier"].value .. "x) "
  pollution = "(Pollution: " .. overrides["evocontrol-pollution-multiplier"].value .. "x) "
  spawners = "(Spawners: " .. overrides["evocontrol-destroy-multiplier"].value .. "x)"
  game.print("Evolution factors: " .. time .. pollution .. spawners)
end)
commands.add_command("evoctrl_values", "get evolution values", function(command)
  map_settings = game.map_settings["enemy_evolution"]
  time = "(Time: " .. map_settings.time_factor .. ") "
  pollution = "(Pollution: " .. map_settings.pollution_factor .. ") "
  spawners = "(Spawners: " .. map_settings.destroy_factor .. ")"
  game.print("Evolution values: " .. time .. pollution .. spawners)
end)
-- Run on init
script.on_init(function()
  set_evolution()
end)