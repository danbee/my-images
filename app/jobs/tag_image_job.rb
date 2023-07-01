require "clarifai"

class TagImageJob < ApplicationJob
  queue_as :default

  def perform(image_id:)
    image = Image.find(image_id)

    tags = Clarifai.new(image.image.file.path).tags
    image.update(tags: tags)
  end
end
