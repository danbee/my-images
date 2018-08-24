require "rails_helper"

describe "user manages images" do
  it "uploads the image" do
    sign_in
    attach_file("Image", "#{Rails.root}/spec/fixtures/spectrum.jpg")
    click_on("Create Image")

    expect(page).to have_css(".image")
  end

  it "deletes the image" do
    user = User.create(uid: 1)
    Image.create(user: user, image: "#{Rails.root}/spec/fixtures/spectrum.jpg")

    sign_in
    click_on("Delete")

    expect(page).not_to have_css(".image")
  end
end
