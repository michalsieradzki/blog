class DeletePostsCategories < ActiveRecord::Migration[7.0]
  def change
    drop_table :posts_categories
  end
end
