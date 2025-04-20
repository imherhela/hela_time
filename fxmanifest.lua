fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3' 
lua54 'yes'

name "hela_time"
author 'ImHerHela'
description 'Dynamic In-Game Clock with Configurable Options'
version '1.0.0'

shared_script {
    'config.lua'
}

client_script {
    'client.lua'
}
ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/style.css',
    'html/script.js',
    'html/fonts/chineserocks.otf'
}