module V1
  class TaskSerializer < ActiveModel::Serializer
    attributes :id, :name, :user_id, :created_at, :tags, :current, :estimate, :progress, :time_spent
  end
end
