require "rails_helper"

describe Image do
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to belong_to(:user) }

  it "should not be valid without an image" do
    image = Image.new
    expect(image).not_to be_valid
  end
end
