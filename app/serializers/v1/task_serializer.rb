module V1
  class TaskSerializer < ActiveModel::Serializer
    attributes :id, :name, :user_id, :created_at, :tags, :current

    def time_spent
      sum = 0
      object.pomodoros.each do |p|
        sum += p.duration
      end
      sum
    end
  end
end
