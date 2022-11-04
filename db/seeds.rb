# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

suits = ["diamonds", "hearts", "spades", "clubs"]
face_cards = {
  "Ace" => 1,
  "King" => 10,
  "Queen" => 10,
  "Jack" => 10
}

base_url = "https://deckofcardsapi.com/static/img/"

      suits.each do |suit|
        suit_first_letter = suit.split("").first.capitalize
        2.upto(10) do |i|
          
          if i == 10
            image = "#{base_url}0#{suit_first_letter}.png"
          else
            image = "#{base_url}#{i}#{suit_first_letter}.png"
          end
          card = Card.new(name = i, high_value = i, low_value = i, suit = suit, image = image)
          card.save
        end

        face_cards.each do |key, value|
          name_first_letter = key.split("").first.capitalize
          image = "#{base_url}#{name_first_letter}#{suit_first_letter}.png"
          if (key != "Ace")
            card = Card.new(name = key, high_value = value, low_value = value, suit = suit, image = image)
          else
            card = Card.new(name = key, high_value = 11, low_value = 1, suit = suit, image = image)
          end
          card.save
        end
      end
