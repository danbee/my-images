module ClarifaiHelpers
  def stub_clarifai(tags)
    clarifai_mock = instance_double(Clarifai)
    allow(clarifai_mock).to receive(:tags).and_return(tags)
    allow(Clarifai).to receive(:new).and_return(clarifai_mock)
  end
end
