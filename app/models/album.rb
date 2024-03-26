class Album < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  has_many :images
end
