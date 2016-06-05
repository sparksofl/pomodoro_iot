class Task < ActiveRecord::Base
  belongs_to :user
  has_many :pomodoros

  validates :current, uniqueness: true
end
