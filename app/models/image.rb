class Image < ActiveRecord::Base
  dragonfly_accessor :image

  validates :image, presence: true

  belongs_to :user
end
