class Task < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  belongs_to :user
  has_many :pomodoros

  def current!
    Task.where(current: true).each(&:not_current!)
    self.update_attribute(:current, true)
  end

  def not_current!
    self.update_attribute(:current, false)
  end

  def progress
    "#{pomodoros.count}/#{estimate}"
  end

  def time_spent
    sum = 0
    pomodoros.each do |p|
      sum += p.duration
    end
    from_time = Time.now
    "spent #{distance_of_time_in_words(from_time, from_time + sum.minutes)}"
  end

  def completed?
    pomodoros.count >= estimate
  end
end
