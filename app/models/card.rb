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
end
