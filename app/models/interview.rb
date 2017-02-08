class Interview < ApplicationRecord
  has_many :proposals

  validates :name, presence: true
  validates :video_url, presence: true
  validates :summary, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :image_thumbnail, ImageUploader
end
