fx_version 'adamant'

game 'gta5'

client_script 'client/client.lua'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua'
}

dependencies {
    'mysql-async',
    'es_extended'
}