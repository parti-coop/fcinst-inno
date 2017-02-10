class AddUpvotesCountToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :upvotes_count, :integer, default: 0
  end
end
