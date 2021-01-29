class RemoveTextFromArticle < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :text
  end
end
