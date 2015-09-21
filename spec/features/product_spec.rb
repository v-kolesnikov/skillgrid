require "rails_helper"
require "support/login_helper"

describe "Product" do
  let!(:user) { FactoryGirl.create(:user, email: "f@b.ru") }

  before (:each) { sign_in("f@b.ru", "foobar") }

  context "add new" do
    before(:each) do
      visit new_product_path
      within("form#new_product") do
        fill_in :product_name, with: "Product name"
        fill_in :product_description, with: "Product description"
        click_on "Create Product"
      end
    end

    it { expect(current_path).to eq(products_path) }
    it { expect(user.products.count).to be 1 }
  end
end
