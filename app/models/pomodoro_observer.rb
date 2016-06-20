class PomodoroObserver < ActiveRecord::Observer
  def after_save(comment)
    Pusher.trigger('test_channel', 'my_event', {
        message: 'hello world'
    })
  end
end
