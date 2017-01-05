class CreateInterviews < ActiveRecord::Migration[5.0]
  def change
    create_table :interviews do |t|
      t.string :name, null: false
      t.string :organization
      t.string :image
      t.text :message
      t.string :video_url, null: false

      t.timestamps null: false
    end
  end
end
