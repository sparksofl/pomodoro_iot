module V1
  class TasksSerializer < ActiveModel::Serializer
    include ActionView::Helpers::DateHelper

    has_one :user, serializer: V1::UserSerializer

    attributes :id, :name, :user_id, :created_at, :user, :tags, :current, :estimate, :progress, :time_spent

    def progress
      "#{object.pomodoros.count}/#{object.estimate}"
    end

    def time_spent
      sum = 0
      object.pomodoros.each do |p|
        sum += p.duration
      end
      from_time = Time.now
      "spent #{distance_of_time_in_words(from_time, from_time + sum.seconds)}"
    end
  end
end
