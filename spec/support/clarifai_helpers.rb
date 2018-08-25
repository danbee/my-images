module ClarifaiHelpers
  def stub_clarifai(tags)
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
