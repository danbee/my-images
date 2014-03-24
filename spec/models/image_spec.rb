require 'spec_helper'

describe Image do
  it 'should not be valid without an image' do
    image = Image.new
    expect(image).not_to be_valid
  end
end
