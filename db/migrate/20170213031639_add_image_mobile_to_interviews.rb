class AddImageMobileToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :image_mobile, :string
  end
end
