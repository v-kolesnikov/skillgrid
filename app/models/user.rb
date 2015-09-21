class User < ActiveRecord::Base
  has_many :products, foreign_key: :owner_id

  validates :email, presence: true, uniqueness: true
  validates :login, presence: true
  validates :password, length: { minimum: 6 }, if: :new_record?

  has_secure_password
end
