class ChangeColumnInMovies < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :view, :integer, :default => 0
  end
end
