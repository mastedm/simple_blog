class ChangeImageToArticles < ActiveRecord::Migration
  def change
    change_column :articles, :image, :string
  end
end
