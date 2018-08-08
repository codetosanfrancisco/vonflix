class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :video
      t.string :title
      t.string :year
      t.string :age
      t.integer :hour
      t.integer :minute
      t.text :starring,array:true, default: []
      t.integer :view
      t.text :genres,array:true, default: []
      t.string :director
      t.text :description

      t.timestamps
    end
  end
end
