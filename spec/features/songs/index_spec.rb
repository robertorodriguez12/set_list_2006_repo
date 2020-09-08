require 'rails_helper'


RSpec.describe 'Songs index page' do
  before :each do
    @artist_1 = artist = Artist.create(name: 'Prince')
    @song_1 = Song.create(title: "Purple Rain",
                          length: 384543,
                          artist: @artist_1,
                          play_count: 5454)
    @song_2 = Song.create(title: "Lets Go Crazy",
                          length: 8435,
                          artist: @artist_1,
                          play_count: 864)
  end

  describe 'it in more details' do
    describe 'it even more' do
      it "I see each song's title" do
        visit '/songs'

        expect(page).to have_content(@song_1.title)
        expect(page).to have_content(@song_2.title)
      end

      it 'I see the play count' do
        visit '/songs'

        expect(page).to have_content(@song_1.play_count)
        expect(page).to have_content(@song_2.play_count)
      end
    end
  end
end
