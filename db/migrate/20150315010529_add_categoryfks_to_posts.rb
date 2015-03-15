class AddCategoryfksToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category_title, :string
    add_column :posts, :category_id, :integer
  end
end
