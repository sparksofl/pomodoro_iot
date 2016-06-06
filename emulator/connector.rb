load 'dependencies.rb'
url = 'test.mosquitto.org'

MQTT::Client.connect(url) do |c|
  c.get('data') do |k,v|
    puts v
  end
end