class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.text :adjective,array:true, default: []
      t.text :audio,array:true, default: []
      t.text :subtitle,array:true, default: []
      t.text :cast,array:true, default: []
      t.belongs_to :movie
      t.timestamps
    end
  end
end
