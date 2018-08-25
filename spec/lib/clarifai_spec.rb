require "spec_helper"
ENV["CLARIFAI_API_KEY"] = "1234"
require "clarifai"

describe Clarifai do
  describe ".predict" do
    it "predicts tags for our image" do
      stub_body = {
        "outputs": [
          {
            "data": {
              "concepts": [
                {
                  "id": "ai_PpTcwbdQ",
                  "name": "computer",
                  "value": 0.96887743,
                },
                {
                  "id": "ai_62K34TR4",
                  "name": "technology",
                  "value": 0.96544206,
                },
              ],
            },
          },
        ],
      }.to_json

      WebMock.
        stub_request(:post, Clarifai::API_URL).
        to_return(status: 200, body: stub_body)

      clarifai_image = Clarifai.new("spec/fixtures/spectrum.jpg")
      clarifai_image.predict!

      expect(clarifai_image.tags).to eq(["computer", "technology"])
    end
  end
end
