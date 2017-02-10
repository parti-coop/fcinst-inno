class RemoveIntroductionAndVideoUrlOfInterviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :interviews, :introduction
    remove_column :interviews, :video_url
  end
end
