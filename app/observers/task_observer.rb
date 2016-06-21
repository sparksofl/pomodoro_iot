class TaskObserver < ActiveRecord::Observer
  def after_update(task)
    Pusher.trigger('android_channel', 'my_event', {
        message: 'Hurray! You have completed your task.'
    }) if task.completed?
  end
end
