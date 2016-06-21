class TaskObserver < ActiveRecord::Observer
  def after_save(task)
    Pusher.trigger('android_channel',
                   'test_event',
                   "Hurray! You have completed your task #{task.name}.") if task.completed?
  end
end
