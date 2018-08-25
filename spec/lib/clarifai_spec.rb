require "spec_helper"
ENV["CLARIFAI_API_KEY"] = "1234"
require "clarifai"

describe Clarifai do
  describe ".tags" do
    it "predicts tags for our image" do
      WebMock.
        stub_request(:post, Clarifai::API_URL).
        to_return(status: 200, body: stub_body.to_json)

      clarifai_image = Clarifai.new("spec/fixtures/spectrum.jpg")

      expect(clarifai_image.tags).to eq(["computer", "technology"])
    end

    def stub_body
      {
        "outputs": [
          {
            "data": {
              "concepts": [
                { "name": "computer", "value": 0.96887743 },
                { "name": "technology", "value": 0.96544206 },
              ],
            },
          },
        ],
      }
    end
  end
end
