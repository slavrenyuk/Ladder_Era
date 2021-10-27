# Ladder Era
The Battle for Wesnoth add-on. Balanced version of the Default Era for competitive play. May be used only with approved 
maps. Adds modified versions of _Den of Onis_, _Hamlets_, _Silverhead Crossing_ and _The Freelands_ maps. 
Provides a map picker for selecting random map from a pool of approved maps.

### Modified maps
Modified maps are placed under `maps` and `scenarios` folders. `allow_scenario` key under the `[era]` tag must contain
the modified map (scenario) ids and not contain their default versions.

### Map pickers

#### Usage notes
Map pickers are used to randomly choose a map from a pool of allowed maps. Thus, players don't know in advance what map 
will be used. Map pickers work well only for online games with 2 human players. Description of the map pickers provides 
information about the map pool they use. Maps may be excluded from a map picker pool under the _Custom Options_ tab. 
At least 2 maps must be present in the pool or an error will be thrown during scenario launch. Map pool settings are not 
reset on game reload.

#### Implementation notes
Map pickers' code is placed in the `map_pickers` folder plus `macros/map_picker.cfg` file. Each map picker consists of 
starting scenario (e.g. `map_pickers/Classic_Maps.cfg`) and a pool of scenarios that the map picker will randomly choose 
from (see `map_pickers/scenarios/` folder). The pool of scenarios is basically a copy of default scenarios plus:
- explicitly specified settings `allow_new_game=no` (don't list the scenario for a new game creation) and 
`experience_modifier=70` (Wesnoth engine applies this setting for normal multiplayer scenarios, but for some reason it 
doesn't apply the setting for the second scenarios)
- code to preserve team colors an village income (otherwise red/blue and `village_income=1` are used)
- side id to make sure that players and their faction/leader selected in the first scenario will be correctly carried to 
the second scenario

### Add-on compatibility
Make sure to not change unit stats for the existing units, but create a new version of units to not break replays.
For example, do not modify unit with `id=Dwarvish Ulfserker Ladder_1`. Instead of that, create new unit with 
`id=Dwarvish Ulfserker Ladder_2` and replace `Dwarvish Ulfserker Ladder_1` with `id=Dwarvish Ulfserker Ladder_2` 
in the recruitment list. As a result, `id=Dwarvish Ulfserker Ladder_1` won't be available for recruitment, but still 
available to run old replays recorded when `id=Dwarvish Ulfserker Ladder_2` was not yet created. Hint: multiple units
may be defined in a single file, e.g. see `units/dwarves/Ulfserker.cfg` file.

### When releasing a new version
- Make sure that password is set in `_server.pbl` file (`passphrase="..."`)  
- Increase add-on version in `_server.pbl` file (`version="..."`) and `era.cfg` file (`#define LADDER_ERA_VERSION "..." #enddef`)
- Update description in `_server.pbl` and `changelog.txt` files

### Wesnoth Markup Language (WML) documentation
https://wiki.wesnoth.org/Referencewml
