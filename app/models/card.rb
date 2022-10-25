class Card
  def initialize(name, high_value, low_value, suit, image)
    @name = name
    @high_value = high_value
    @low_value = low_value
    @suit = suit
    @image = image
  end

  def name
    return "#{@name} of #{@suit.capitalize}"
  end


  def high_value
    return @high_value
  end

  def low_value
    return @low_value
  end

  def image
    return @image
  end

  def card_as_two_characters
    if @name == "Ace" || @name == "King" || @name == "Queen" || @name == "Jack"
      card_initial = @name.split("").first
    elsif @name == "10"
      card_initial = "0"
    else
      card_initial = @name
    end

    suit_initial = @suit.split("").first.capitalize

    return "#{card_initial}#{suit_initial}"

  end
end
