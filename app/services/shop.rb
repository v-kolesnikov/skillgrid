require "net/http"
require "uri"

class Shop
  IMAGES_URL = "http://jsonplaceholder.typicode.com/photos"
  TODOS_URL = "http://jsonplaceholder.typicode.com/todos"
  IMAGES_COUNT = 5000

  def self.buy(user, product)
    photo = get_photo
    if correct_colors?(photo)
      PurchaseMailer.user_notification(user, photo[:url])
      return true
    else
      PurchaseMailer.admins_notification(user.email, get_todo(photo[:id])[:id])
      return false
    end
  end

  protected

  def self.get_photo
    api_request("#{IMAGES_URL}/#{photo_id}")
  end

  def self.get_todo(id)
    api_request("#{TODOS_URL}/#{id}")
  end

  def self.photo_id
    SecureRandom.random_number(IMAGES_COUNT)
  end

  def self.correct_colors?(photo)
    original_color = URI(photo[:url]).path.split("/").last.to_i(16)
    thumb_color = URI(photo[:thumbnailUrl]).path.split("/").last.to_i(16)
    original_color >= thumb_color
  end

  def self.api_request(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    ActiveSupport::JSON.decode(response.body).symbolize_keys
  end
end
