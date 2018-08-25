ENV["CLARIFAI_API_KEY"] = "1234"

require "spec_helper"
require "clarifai"
require_relative "../support/clarifai_helpers"

describe Clarifai do
  include ClarifaiHelpers

  describe ".tags" do
    it "predicts tags for our image" do
      stub_clarifai(%w[computer technology])

      clarifai_image = Clarifai.new("spec/fixtures/spectrum.jpg")

      expect(clarifai_image.tags).to eq(%w[computer technology])
    end
  end
end
