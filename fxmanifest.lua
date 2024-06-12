fx_version 'cerulean'
game 'gta5'
lua54 'yes'

client_scripts {
    'client/client.lua',
    'config/clientCfg.lua',
    'client/checkGameInjury.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'config/serverCfg.lua',
    'server/retGameInjury.lua'
}

shared_scripts {
    '@es_extended/imports.lua'
}