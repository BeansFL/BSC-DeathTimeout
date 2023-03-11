-- Configuration
fx_version 'cerulean'
game 'gta5'
author 'BSC Studios'
description 'DeathTimeout script by BeansFL#2022' -- https://discord.gg/bsc-studios
version '1.1.0'

-- Files Registration

ui_page 'html/index.html'
shared_script 'config.lua'
client_script 'lua/client.lua'
server_script 'lua/commands.lua'

files {
    'html/index.html',
    'html/js/*.js',
    'html/css/*.css',
    'html/sound/*.mp3' 
} 

lua54 'yes'
 
