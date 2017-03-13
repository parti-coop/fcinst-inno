class AddImageAndImageThumbnailToInsights < ActiveRecord::Migration[5.0]
  def change
    add_column :insights, :image, :string, null: false
    add_column :insights, :image_thumbnail, :string, null: false
  end
end
