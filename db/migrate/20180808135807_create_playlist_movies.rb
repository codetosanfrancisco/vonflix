class CreatePlaylistMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :playlist_movies do |t|
      t.belongs_to :movie, foreign_key: true
      t.belongs_to :playlist, foreign_key: true

      t.timestamps
    end
  end
end
