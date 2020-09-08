require 'rails_helper'

RSpec.describe 'Adding a song to the cart' do
  before :each do
    @artist_1 = Artist.create(name: 'Prince')
    @song_1 = Song.create(title: "Purple Rain",
                          length: 384543,
                          artist: @artist_1,
                          play_count: 5454)
    @song_2 = Song.create(title: "Lets Go Crazy",
                          length: 8435,
                          artist: @artist_1,
                          play_count: 864)
  end

  it 'shows a message that the song has been added' do
    visit '/songs'

    within "#song-#{@song_1.id}" do
      click_button 'Add to Cart'
    end

    expect(current_path).to eq('/songs')
    expect(page).to have_content("You now have 1 copy of #{@song_1.title} in your cart.")
  end

  it 'can add multiple songs to the cart' do
    visit '/songs'

    within "#song-#{@song_1.id}" do
      click_button 'Add to Cart'
    end

    within "#song-#{@song_2.id}" do
      click_button 'Add to Cart'
    end

    within "#song-#{@song_1.id}" do
      click_button 'Add to Cart'
    end

    expect(page).to have_content("You now have 2 copies of #{@song_1.title} in your cart.")
  end
end
# S - setup
# E - exercise/execute
# A - assertion
#
#
# T - teardown
