class User < ActiveRecord::Base
  # include Authenticatable
  # validate :confirm_password

  has_secure_password
end
