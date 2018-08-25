require "base64"
require "http"

class Clarifai
  KEY = ENV.fetch("CLARIFAI_API_KEY").freeze
  API_URL = "https://api.clarifai.com/v2/models/" \
            "aaa03c23b3724a16a56b629203edc62c/outputs".freeze

  attr_reader :tags

  def initialize(image_path)
    @image_path = image_path
  end

  def predict!
    headers = {
      "Authorization": "Key #{KEY}",
      "Content-Type": "application/json",
    }
    params = {
      "inputs": [
        {
          "data": {
            "image": {
              "base64": Base64.encode64(File.read(@image_path)),
            },
          },
        },
      ],
    }

    resp = HTTP.
      headers(headers).
      post(API_URL, json: params)

    extract_tags(JSON.parse(resp.body))
  end

  def extract_tags(response_hash)
    @tags = response_hash["outputs"][0]["data"]["concepts"].map do |concept|
      concept["name"]
    end
  end
end
