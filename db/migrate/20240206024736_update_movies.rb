class UpdateMovies < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, "year_released"
    add_column :movies, "year_released", :integer
  end
end
