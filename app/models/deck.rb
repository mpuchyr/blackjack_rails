class Deck
  def initialize
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
        card = Card.new(name = i, value = i, suit = suit, image = image)
        @cards.push(card)
      end

      face_cards.each do |key, value|
        name_first_letter = key.split("").first.capitalize
        image = "#{base_url}#{name_first_letter}#{suit_first_letter}.png"
        card = Card.new(name = key, value = value, suit = suit, image = image)
        @cards.push(card)
      end
    end

    self.shuffle
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

  def cards
    return @cards
  end
end
