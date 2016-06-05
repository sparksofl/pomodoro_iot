require 'net/http'
require 'json'

def run
  print "Enter your timer's token: "
  token = gets.chomp.to_s

  loop do
    print "Enter pomodoro's duration: "
    duration = gets.chomp.to_i
    uri = URI('http://192.168.0.29:3000/pomodoros')
    params = {'duration' => duration,
              'token' => token}
    res = Net::HTTP.post_form(uri, params)
    sleep duration
  end
end