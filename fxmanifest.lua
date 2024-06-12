fx_version 'cerulean'
game 'gta5'
lua54 'yes'

client_scripts {
    'client/client.lua',
    'config/clientCfg.lua'
}

server_scripts {
    'server/server.lua',
    'config/serverCfg.lua'
}

shared_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@es_extended/imports.lua'
}