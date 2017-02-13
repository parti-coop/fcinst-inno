class Interview < ApplicationRecord
  has_many :proposals

  validates :name, presence: true
  validates :summary, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :image_thumbnail, ImageUploader

  scope :recent, -> { order(created_at: :desc) }

  def next
    Interview.where("id > ?", self.id).first
  end

  def prev
    Interview.where("id < ?", self.id).last
  end
end
