class Deck

  attr_accessor :cards

  def initialize(cards = [])
    if cards.count == 0
      @cards = []
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
          @cards.push(card)
        end

        face_cards.each do |key, value|
          name_first_letter = key.split("").first.capitalize
          image = "#{base_url}#{name_first_letter}#{suit_first_letter}.png"
          if (key != "Ace")
            card = Card.new(name = key, high_value = value, low_value = value, suit = suit, image = image)
          else
            card = Card.new(name = key, high_value = 11, low_value = 1, suit = suit, image = image)
          end
          @cards.push(card)
        end
      end
      self.shuffle
    else
      @cards = []
      base_url = "https://deckofcardsapi.com/static/img/"
      cards.each do |card|
        card_info = card.split("")
        suit_info = card_info[1]
        case(card_info[0])
        when "A"
          # new_card = Card.new("Ace", 11, 1, "#{base_url}/")

        when "K"
        when "Q"
        when "J"
        else
        end
      end
    end


  end

  def shuffle
    @cards = @cards.shuffle
  end

  def deal_card
    if @cards.count > 0
      return @cards.pop
    end
  end

  def count
    return @cards.count
  end

  # def cards
  #   return @cards
  # end
end
