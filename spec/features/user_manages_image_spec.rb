require "rails_helper"

feature "user manages images" do
  include ActiveJob::TestHelper

  it "uploads the image" do
    stub_clarifai(%w[computer technology])

    sign_in
    attach_file("Image", "#{Rails.root}/spec/fixtures/spectrum.jpg")
    click_on("Create Image")

    expect(page).to have_css(".image")
  end

  it "deletes the image" do
    user = User.create(uid: "1")
    Image.create(
      user: user,
      image: File.new("#{Rails.root}/spec/fixtures/spectrum.jpg"),
    )

    sign_in(user)
    click_on("Delete")

    expect(page).not_to have_css(".image")
  end

  it "views the image with tags" do
    stub_clarifai(%w[computer technology])

    sign_in
    attach_file("Image", "#{Rails.root}/spec/fixtures/spectrum.jpg")
    perform_enqueued_jobs do
      click_on("Create Image")
    end
    page.find(".image").click

    %w[computer technology].each do |tag|
      expect(page).to have_content(tag)
    end
  end
end
