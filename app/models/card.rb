class Card
  def initialize(name, value, suit, image)
    @name = name
    @value = value
    @suit = suit
    @image = image
  end

  def name
    return "#{@name} of #{@suit.capitalize}"
  end

  def value
    return @value
  end

  def image
    return @image
  end
end
