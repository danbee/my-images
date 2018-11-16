require "base64"
require "http"

class Clarifai
  API_KEY = ENV.fetch("CLARIFAI_API_KEY").freeze
  API_URL = "https://api.clarifai.com/v2/models/" \
            "aaa03c23b3724a16a56b629203edc62c/outputs".freeze

  def initialize(image_data)
    @image_data = image_data
  end

  def tags
    @tags ||= extract_tags(JSON.parse(post_image.body))
  end

  private

  attr_reader :image_data

  def extract_tags(response_hash)
    response_hash["outputs"][0]["data"]["concepts"].map do |concept|
      concept["name"]
    end
  end

  def post_image
    HTTP.
      headers(headers).
      post(API_URL, json: payload)
  end

  def headers
    {
      "Authorization": "Key #{API_KEY}",
      "Content-Type": "application/json",
    }
  end

  def payload
    { "inputs": [{ "data": { "image": { "base64": image_base64 } } }] }
  end

  def image_base64
    Base64.encode64(image_data)
  end
end
