class Artist < ApplicationRecord
  has_many :songs
  validates_presence_of :name

  def average_song_length
    song_length_sum = songs.sum {|song| song.length}
    song_length_sum / songs.length
  end
end
