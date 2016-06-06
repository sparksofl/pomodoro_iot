# require 'json'
# require 'rubygems'
# require 'mqtt'
#
# def run
#   # print "Enter your timer's token: "
#   # token = gets.chomp.to_s
#
#   # token = 'F6DZRqfm1A3JvHgD7qmavkw9'
#
#   # loop do
#     # print "Enter pomodoro's duration: "
#     # duration = gets.chomp.to_i
#
#     # MQTT::Client.connect('192.168.0.29') do |c|
#     #   c.publish(duration, token)
#     # end
#
#
#     MQTT::Client.connect('mqtt://192.168.0.29') do |client|
#
#       client.publish('test', "The time is: #{Time.now}")
#
#     end
#
#     # uri = URI('http://192.168.0.29:3000/pomodoros')
#     # params = {'duration' => duration,
#     #           'token' => token}
#     res = Net::HTTP.post_form(uri, params)
#   #   sleep duration
#   # end
# end
#
# run

require 'rubygems'
require 'mqtt'

# Publish example
MQTT::Client.connect('mqtt://localhost:1883') do |c|
  c.publish('test', 'message')
end
