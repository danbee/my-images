require "rails_helper"

describe Image do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_attached_file(:image) }
  it { is_expected.to validate_attachment_of(:image) }
end
