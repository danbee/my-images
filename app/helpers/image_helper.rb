module ImageHelper
  def image_thumb(image, size)
    image.thumb(size).encode("jpg", "-quality 90")
  end
end
