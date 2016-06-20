# Rails API for pomodoro iot course work

<img src="https://codeship.com/projects/8e2548f0-0195-0134-ea95-2e7e86e65593/status?branch=master" alt="Status?branch=master" />
<img src="https://codeclimate.com/repos/57686534b6bdb80064000d22/badges/92701d3405c86b27bd07/gpa.svg" />
<img src="https://codeclimate.com/repos/57686534b6bdb80064000d22/badges/92701d3405c86b27bd07/issue_count.svg" />

##Setup
```
bundle
rake db:create db:migrate db:seed
rails s
```

##Emulator

implemented with the [CloudMQTT](https://www.cloudmqtt.com/)

run ```irb``` from within ```emulator``` directory in two tabs
 1. load ```'connector.rb'``` in the first tab
 2. load ```'emulator.rb'``` in another tab for each time the random generated pomodoro is needed

