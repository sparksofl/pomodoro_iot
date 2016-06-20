class PomodoroObserver < ActiveRecord::Observer
  def after_create(pomodoro)
    Pusher.trigger('test_channel', 'my_event', {
        message: pomodoro.id
    })
  end
end
