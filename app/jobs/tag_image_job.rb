class TagImageJob < ApplicationJob
  queue_as :default

  def perform(image_id:)
    image = Image.find(image_id)

    tags = Clarifai.new(image.image.download).tags
    image.update_attributes(tags: tags)
  end
end
