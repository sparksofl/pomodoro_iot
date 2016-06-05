module V1
  class SessionSerializer < ActiveModel::Serializer

    attributes :email, :username, :token_type, :user_id, :access_token, :timer_token

    def user_id
      object.id
    end

    def token_type
      'Bearer'
    end

    def timer_token
      object.timers.first.token
    end
  end
end
