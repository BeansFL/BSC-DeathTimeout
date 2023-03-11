# BSC-DeathTimeout
Introducing DeathTimeout - the free FiveM script that adds a realistic hurt system. Players are presented with title &amp; text and remain hurt for a set time before being revived. Optional special effects &amp; "adminclear" command available. Download now to elevate your gameplay.

## Usage

```lua 
exports['BSC-DeathTimeout']:DeathTimeOut()
```

### For ESX
* open `esx-ambulancejob` > `client` > `main.lua`
* find `esx_ambulancejob:revive`
* and add this to the last line 
```lua 
exports['BSC-DeathTimeout']:DeathTimeOut()
```

### For QBCore
* open `qb-ambulancejob` > `client` > `main.lua`
* find `hospital:client:Revive`
* and add this to the last line 
```lua 
exports['BSC-DeathTimeout']:DeathTimeOut()
```

### Discord: https://discord.gg/bsc-studios
