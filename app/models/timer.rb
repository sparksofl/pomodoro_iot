class Timer < ActiveRecord::Base
  has_secure_token

  belongs_to :user
end
