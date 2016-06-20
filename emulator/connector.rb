load 'dependencies.rb'
require 'net/http'
LOCAL_URI = 'http://localhost:3000/pomodoros'

def run
  print "Enter devise's serial number: "
  token = gets.chomp.to_s
  puts "Running device with #{token} serial number..."
  Thread.new do
    MQTT::Client.connect(@conn_opts) do |c|
      puts "Connection established. Waiting for data..."
      c.get('data') do |k,v|
        puts "Data is received. Sending to the server..."
        send_data v, token
        puts "Done. Waiting for data..."
      end
    end
  end
end

def send_data(duration, token)
  duration = duration.to_i
  uri = URI(LOCAL_URI)
  params = {'duration' => duration,
            'token' => token}
  res = Net::HTTP.post_form(uri, params)
  sleep 0
end

run
