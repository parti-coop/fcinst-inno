class AddImageThumbnailToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :image_thumbnail, :string
  end
end
