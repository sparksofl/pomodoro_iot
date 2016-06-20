require 'rubygems'
require 'mqtt'
require 'uri'
require 'json'
require 'rubygems'

uri = URI.parse ENV['CLOUDMQTT_URL'] || 'mqtt://localhost:1883'
@conn_opts = {
  remote_host: uri.host,
  remote_port: uri.port,
  username: uri.user,
  password: uri.password,
}
