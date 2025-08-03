fx_version 'cerulean'
lua54 'yes'
game 'gta5'

author 'StevoScripts'
description 'Dev Tools'
version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
}

client_scripts {
	'tools/**/client.lua'
}

server_scripts {
	'tools/**/server.lua'
}

files {
	'config.lua',
}
