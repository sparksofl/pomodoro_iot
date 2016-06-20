load 'dependencies.rb'
n = 1

n.times do
  duration = Random.new.rand(5..55)
  MQTT::Client.connect(@conn_opts) do |c|
    c.publish('data', duration)
  end
  sleep 0
end
