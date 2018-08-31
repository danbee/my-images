require "rails_helper"

feature "user manages image tags by visitng images show page" do
  scenario "and can see an X to link for deletion on a tag" do
    tags = ["one", "two"]
    user = User.create(uid: "123")
    Image.create(
      user: user,
      tags: tags,
      image: File.new("#{Rails.root}/spec/fixtures/spectrum.jpg"),
    )

    sign_in(user)
    page.find(".image").click

    within("#tag-#{tags.first}") do
      expect(page).to have_css(".delete-tag")
    end
  end

  scenario "and can click the link to delete a tag" do
    tags = ["one", "two"]
    user = User.create(uid: "123")
    Image.create(
      user: user,
      tags: tags,
      image: File.new("#{Rails.root}/spec/fixtures/spectrum.jpg"),
    )

    sign_in(user)
    page.find(".image").click

    within("#tag-#{tags.first}") do
      page.find(".delete-tag").click
    end

    expect(page).to_not have_content(tags.first)
  end

  scenario "user can add a tag to the list of tags" do
    tags = ["one", "two"]
    user = User.create(uid: "123")
    new_tag = "new tag"
    Image.create(
      user: user,
      tags: tags,
      image: File.new("#{Rails.root}/spec/fixtures/spectrum.jpg"),
    )

    sign_in(user)
    page.find(".image").click

    fill_in("tag", with: new_tag)
    click_on("Add Tag")

    expect(page).to have_content(new_tag)
  end
end
