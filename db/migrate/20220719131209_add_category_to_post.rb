class AddCategoryToPost < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :posts, :category, foreign_key: true
  end
end
