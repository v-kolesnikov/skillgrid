class Guest < ActiveRecord::Base
  has_one :user, as: :account, dependent: :destroy
end
