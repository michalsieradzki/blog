class CreatePostsCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_posts, id: false do |t|
      t.integer :category_id
      t.integer :posts
    end
  end
end
