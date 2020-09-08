class Cart
  attr_reader :contents

  def initialize(contents)
    if contents
      @contents = contents
    else
      @contents = Hash.new
    end
  end

  def add_song(song)
    song_id_str = song.id.to_s
    @contents[song_id_str] ||= 0
    @contents[song_id_str] += 1
  end

  def quantity_of(song)
    song_id_str = song.id.to_s
    @contents[song_id_str]
  end

  def grand_total
    @contents.sum do |song_id, quantity|
      song = Song.find(song_id)
      quantity * song.price
    end
  end

  def total_quantity
    @contents.values.sum
  end
end
