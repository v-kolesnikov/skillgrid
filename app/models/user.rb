class User < ActiveRecord::Base
  has_many :products, foreign_key: :owner_id

  has_secure_password
end
