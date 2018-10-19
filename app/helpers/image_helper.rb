module ImageHelper
  def image_variant(image, variant)
    image.variant(variant)
  end

  def image_thumb(image, size)
    image.variant(
      combine_options: {
        gravity: "center",
        resize: "#{size}x#{size}^",
        extent: "#{size}x#{size}",
      },
    )
  end
end
