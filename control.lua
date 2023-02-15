function set_evolution()
  overrides = settings.startup
  map_settings = game.map_settings["enemy_evolution"]
  map_settings.time_factor = map_settings.time_factor * overrides["evocontrol-time-multiplier"].value
  map_settings.pollution_factor = map_settings.pollution_factor * overrides["evocontrol-pollution-multiplier"].value
  map_settings.destroy_factor = map_settings.destroy_factor * overrides["evocontrol-destroy-multiplier"].value
end
commands.add_command("evoctrl_multiplier", "get evolution multipliers", function(command)
  overrides = settings.startup
  output = {}
  output["Time"] = "Time: " .. overrides["evocontrol-time-multiplier"].value .. "x"
  output["Pollution"] = "Pollution: " .. overrides["evocontrol-pollution-multiplier"].value .. "x"
  output["Spawners"] = "Spawners: " .. overrides["evocontrol-destroy-multiplier"].value .. "x"
  game.print("Evolution factors: (" .. output.Time .. ") (" .. output.Pollution .. ") (" .. output.Spawners .. ")")
end)
commands.add_command("evoctrl_values", "get evolution values", function(command)
  map_settings = game.map_settings["enemy_evolution"]
  output = {}
  output["Time"] = "Time: " .. map_settings.time_factor
  output["Pollution"] = "Pollution: " .. map_settings.pollution_factor
  output["Spawners"] = "Spawners: " .. map_settings.destroy_factor
  game.print("Evolution values: (" .. output.Time .. ") (" .. output.Pollution .. ") (" .. output.Spawners .. ")")
end)
script.on_init(function()
  set_evolution()
end)