class AddCategoryToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :category, :string
    add_column :lessons, :address, :string
  end
end
