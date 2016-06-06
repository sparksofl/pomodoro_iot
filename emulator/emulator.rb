load 'dependencies.rb'
url = 'test.mosquitto.org'
n = 1

n.times do
  duration = Random.new.rand(5..55)
  MQTT::Client.connect(url) do |c|
    c.publish('data', duration)
  end
  sleep 0
end
