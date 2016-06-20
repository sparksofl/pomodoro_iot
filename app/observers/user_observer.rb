class UserObserver < ActiveRecord::Observer
  def after_create(user)
    user.timers << Timer.create
    user.timers.last.update_attribute(:user_id, user.id)
  end
end
