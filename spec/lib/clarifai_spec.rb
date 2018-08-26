ENV["CLARIFAI_API_KEY"] = "1234"

require "spec_helper"
require "clarifai"
require_relative "../support/clarifai_helpers"

describe Clarifai do
  include ClarifaiHelpers

  describe ".tags" do
    it "predicts tags for our image" do
      stub_api(%w[computer technology])

      clarifai = Clarifai.new("spec/fixtures/spectrum.jpg")

      expect(clarifai.tags).to eq(%w[computer technology])
    end
  end

  def stub_api(tags)
    WebMock.
      stub_request(:post, Clarifai::API_URL).
      to_return(status: 200, body: stub_body(tags).to_json)
  end

  def stub_body(tags)
    { "outputs": [{ "data": { "concepts": tag_structure(tags) } }] }
  end

  def tag_structure(tags)
    tags.map do |tag|
      { "name": tag, "value": 0.95 }
    end
  end
end
