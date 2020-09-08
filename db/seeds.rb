# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@artist_1 = Artist.create(name: 'Prince')
@song_1 = Song.create(title: "Purple Rain",
                      length: 384543,
                      artist: @artist_1,
                      play_count: 5454)
@song_2 = Song.create(title: "Lets Go Crazy",
                      length: 8435,
                      artist: @artist_1,
                      play_count: 864)
