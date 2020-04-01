# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

jack = User.create(username: 'Jack Black')
matt = User.create(username: 'Matt Wrong')
hacker = User.create(username: 'Hacker Boy')
albert = User.create(username: 'Albert Two')

Artwork.destroy_all 

ship = Artwork.create(title: 'Ship', image_url: 'Ship_painting', artist_id: jack.id)
rock = Artwork.create(title: 'Rock', image_url: 'Rock_painting', artist_id: matt.id)
keyboard = Artwork.create(title: 'Keyboard', image_url: 'Keyboard_painting', artist_id: matt.id)

ArtworkShare.destroy_all
#not working, unseeded
share_1 = ArtworkShare.create(artwork_id: ship.id, viewer_id: hacker.id)
share_2 = ArtworkShare.create(artwork_id: ship.id, viewer_id: albert.id)
share_3 = ArtworkShare.create(artwork_id: rock.id, viewer_id: jack.id)


