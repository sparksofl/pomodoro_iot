# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '213614'
Pusher.key = '1991c289a458393cc0e0'
Pusher.secret = '9754c5de952da3a98886'
Pusher.logger = Rails.logger
Pusher.encrypted = true
