class Product < ActiveRecord::Base
  belongs_to :owner, class_name: "User"

  validates :name, :description, presence: true
end
