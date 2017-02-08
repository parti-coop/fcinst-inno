class Interview < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :image_thumbnail, ImageUploader
end
