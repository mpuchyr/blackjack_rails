class Card
  def initialize(name, value, suit)
    @name = name
    @value = value
    @suit = suit
  end

  def card_name
    return "#{@name} of #{@suit}"
  end

  def get_value
    return @value
  end
end
