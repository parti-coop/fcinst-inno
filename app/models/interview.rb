class Interview < ApplicationRecord
  has_many :proposals

  mount_uploader :image, ImageUploader
  mount_uploader :image_thumbnail, ImageUploader
end
