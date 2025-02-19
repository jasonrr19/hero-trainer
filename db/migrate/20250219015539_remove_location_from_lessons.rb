class RemoveLocationFromLessons < ActiveRecord::Migration[7.1]
  def change
    remove_column :lessons, :location, :string
  end
end
