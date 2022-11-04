class Deck

  attr_accessor :cards

  def initialize(cards = [])
    if cards.count == 0
      self.cards = []
      Card.all.each do |card|
        self.cards.push(card.id)
      end
      self.cards = self.cards.shuffle
    else
      self.cards = cards
    end

  end

  def shuffle
    @cards = @cards.shuffle
  end

  def deal_card
    if @cards.count > 0
      card_id = @cards.pop
      return Card.where(:id => card_id).first
    end
  end

  def count
    return @cards.count
  end

  # def cards
  #   return @cards
  # end
end
