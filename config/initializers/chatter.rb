require 'chatter'

Chatter.subdomain = ENV['CAMPFIRE_SUBDOMAIN']
Chatter.token = ENV['CAMPFIRE_AUTH_TOKEN']
Chatter.room_name = ENV['CAMPFIRE_ROOM_NAME']
