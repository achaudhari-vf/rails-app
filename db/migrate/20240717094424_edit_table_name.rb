class EditTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table :table_articles, :articles
  end
end
