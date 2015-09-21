require "rails_helper"
require "support/login_helper"

describe "User session" do
  let!(:user) { FactoryGirl.create(:user, email: "f@b.ru") }

  context "redirect after login" do
    before (:each) { sign_in("f@b.ru", "foobar") }
    it { expect(current_path).to eq(root_path) }
  end
end
