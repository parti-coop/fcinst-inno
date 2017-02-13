class CreateInsights < ActiveRecord::Migration[5.0]
  def change
    create_table :insights do |t|
      t.string :title, null: false
      t.text :body, :body, null: false

      t.timestamps null: false
    end
  end
end
