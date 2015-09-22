class Admin < ActiveRecord::Base
  has_one :user, as: :account

  has_attached_file :avatar
  has_attached_file :photo
end
