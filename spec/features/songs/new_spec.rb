require 'rails_helper'

RSpec.describe "creating a new song" do
  it "can create a song" do

#     (As a User )
    artist = Artist.create(name: "Journey")
    title = "Don't Stop Believin'"
    length = 231
    play_count = 7849

    # When I visit the page to create a new song as a nested resource
    visit "/artists/#{artist.id}/songs/new"
    # With the path:  /artists/:artist_id/songs/new

    # Then there is a form to add the Title, Length, and Play_Count of a new song
    fill_in :title, with: title
    fill_in :length, with: length
    fill_in :play_count, with: play_count

    click_on "Create Song"
    # And When I fill this form in and click the Create Song button

    new_song = Song.last

    # Then my path is /songs/:id where :id is the id of the song I created
    expect(current_path).to eq("/songs/#{new_song.id}")
    # And the page displays that songs artist, title, length, and play_count
    expect(page).to have_content(new_song.title)
    expect(page).to have_content(new_song.length)
    expect(page).to have_content(new_song.play_count)
    expect(page).to have_content(new_song.artist.name)
  end
end
