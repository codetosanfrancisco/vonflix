class Playlist < ApplicationRecord
  has_many :playlist_movies
  has_many :movies,through: :playlist_movies
  belongs_to :user
end
