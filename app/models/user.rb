class User < ActiveRecord::Base
  has_many :product, foreign_key: :owner_id

  has_secure_password
end
