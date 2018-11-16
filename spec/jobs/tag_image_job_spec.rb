require "rails_helper"

describe TagImageJob, type: :job do
  describe ".perform" do
    it "tags an image" do
      stub_clarifai(%w[computers technology])
      image = Image.new
      image.image.attach(
        io: File.open("#{Rails.root}/spec/fixtures/spectrum.jpg"),
        filename: "spectrum.jpg",
      )
      image.save

      TagImageJob.perform_now(image_id: image.id)
      image.reload

      expect(image.tags).to eq(%w[computers technology])
    end
  end
end
