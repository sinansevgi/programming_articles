class AddVotesCountToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :votes_count, :integer, default: 0, null: false
  end
end
