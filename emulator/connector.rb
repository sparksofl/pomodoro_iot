load 'dependencies.rb'
require 'net/http'
URL = 'test.mosquitto.org'
LOCAL_URI = 'http://192.168.0.29:3000/pomodoros'
TOKEN = 'F6DZRqfm1A3JvHgD7qmavkw9'

def run
  puts "Running device with #{TOKEN} serial number..."
  MQTT::Client.connect(URL) do |c|
    puts "Connection established. Waiting for data..."
    c.get('data') do |k,v|
      puts "Data is received. Sending to the server..."
      send_data v
      puts "Done. Waiting for data..."
    end
  end
end

def send_data(duration)
  duration = duration.to_i
  uri = URI(LOCAL_URI)
  params = {'duration' => duration,
            'token' => TOKEN}
  res = Net::HTTP.post_form(uri, params)
  sleep 0
end

run