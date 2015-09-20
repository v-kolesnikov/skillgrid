class Product < ActiveRecord::Base
  belongs_to :owner, class_name: "User"

  validates :name, :description, presence: true

  has_attached_file :image, styles: { medium: "360x360", thumb: "100x100" },
                            default_url: "products/missing/:style/missing.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ },
                               size: { in: 0..1.megabytes }
end
