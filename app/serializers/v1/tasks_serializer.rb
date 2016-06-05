module V1
  class TasksSerializer < ActiveModel::Serializer
    has_one :user, serializer: V1::UserSerializer

    attributes :id, :name, :user_id, :created_at, :user, :tags
  end
end
