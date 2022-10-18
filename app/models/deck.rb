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

    suits.each do |suit|
      2.upto(10) do |i|
        card = Card.new(name = i, value = i, suit = suit)
        @cards.push(card)
      end

      face_cards.each do |key, value|
        card = Card.new(name = key, value = value, suit = suit)
        @cards.push(card)
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
end
