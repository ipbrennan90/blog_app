class AddCategoryfksToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category_title, :string
  end
end
