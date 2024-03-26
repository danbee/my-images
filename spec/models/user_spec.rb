require "rails_helper"

describe User do
  it { is_expected.to have_many(:images) }
  it { is_expected.to have_many(:albums) }
end
