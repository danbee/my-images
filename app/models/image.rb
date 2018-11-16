class Image < ActiveRecord::Base
  has_one_attached :image

  validates :image, attached: true

  belongs_to :user
end
