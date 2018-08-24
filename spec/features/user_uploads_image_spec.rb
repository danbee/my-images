require "rails_helper"

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
  provider: "github",
  uid: "1",
)

describe "user uploads image" do
  it "uploads the image" do
    visit "/"

    sign_in

    save_and_open_page

    attach_file("Image", "#{Rails.root}/spec/fixtures/spectrum.jpg")
  end

  def sign_in
    within(".centre-stage") do
      click_link("Sign in with GitHub")
    end
  end
end
