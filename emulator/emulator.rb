load 'dependencies.rb'
url = 'test.mosquitto.org'

5.times do
  r = Random.new.rand(5..55)
  MQTT::Client.connect(url) do |c|
    c.publish('data', r)
  end
  sleep 1
end
