class Interview < ApplicationRecord
  has_many :proposals

  validates :name, presence: true
  validates :summary, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :image_mobile, ImageUploader
  mount_uploader :image_thumbnail, ImageUploader

  scope :recent, -> { order(created_at: :desc) }

  def find_others
    Interview.where("id = ?", self.id)
  end

  def next
    Interview.where("id > ?", self.id).any? ? Interview.where("id > ?", self.id).first : self.find_others.first
  end

  def prev
    Interview.where("id < ?", self.id).any? ? Interview.where("id < ?", self.id).last : self.find_others.last
  end
end
