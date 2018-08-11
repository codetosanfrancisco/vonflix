class AddColumnToDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :details,:adjective,:string
  end
end
