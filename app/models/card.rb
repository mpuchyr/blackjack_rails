class Card
  def initialize(name, value, suit)
    @name = name
    @value = value
    @suit = suit
  end

  def name
    return "#{@name} of #{@suit.capitalize}"
  end

  def get_value
    return @value
  end
end
