class RemoveColumnFromMovie < ActiveRecord::Migration[5.2]
  def change
    remove_column :details,:adjective,:text
  end
end
