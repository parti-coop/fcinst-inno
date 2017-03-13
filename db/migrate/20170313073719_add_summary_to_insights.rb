class AddSummaryToInsights < ActiveRecord::Migration[5.0]
  def change
    add_column :insights, :summary, :text, null: false
  end
end
