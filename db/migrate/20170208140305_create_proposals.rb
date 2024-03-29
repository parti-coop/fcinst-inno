class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC" do |t|
      t.string :title, null: false
      t.string :image
      t.references :interview, null: false, index: true

      t.timestamps null: false
    end
  end
end
