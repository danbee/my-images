class Image < ActiveRecord::Base
  dragonfly_accessor :df_image
  has_one_attached :image

  validates :image, presence: true

  belongs_to :user
end
