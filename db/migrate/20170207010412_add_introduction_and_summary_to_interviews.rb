class AddIntroductionAndSummaryToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :introduction, :text
    add_column :interviews, :summary, :text
  end
end
