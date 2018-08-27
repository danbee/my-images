module ImageHelper
  def image_thumb(image, size)
    if image.format == "jpeg"
      image.thumb(size).encode("jpg", "-quality 90")
    else
      image.thumb(size)
    end
  end
end
