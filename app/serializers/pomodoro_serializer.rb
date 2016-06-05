class PomodoroSerializer < ActiveModel::Serializer
  attributes :id, :duration, :task_id
end
