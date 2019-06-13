local T = wml.tag

local res = {}

res.slow_6mp_leaders = function(args)
    local make_6mp_leaders_slow = wml.variables["make_6mp_leaders_slow"]
    if make_6mp_leaders_slow == nil then
        make_6mp_leaders_slow = wesnoth.game_config.mp_settings and (wesnoth.game_config.mp_settings.mp_campaign == "")
    end
    if not make_6mp_leaders_slow then
        return
    end

    local trait_slow = args[1][2]
    for i, unit in ipairs(wesnoth.get_units { canrecruit = true, T.filter_wml { max_moves = 6 } }) do
        if not unit.variables.dont_make_me_slow then
            wesnoth.add_modification(unit, "trait", trait_slow )
            unit.moves = unit.max_moves
            unit.hitpoints = unit.max_hitpoints
        end
    end
end
return res
