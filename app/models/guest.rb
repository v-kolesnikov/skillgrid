class Guest < ActiveRecord::Base
  has_one :user, as: :account, dependent: :destroy

  def can_buy?
    /[a-z]+@[a-z]+\.(?!com)/ =~ email
  end
end
