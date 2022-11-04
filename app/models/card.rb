# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  high_value :integer
#  image      :string
#  low_value  :integer
#  name       :string
#  suit       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Card < ApplicationRecord
  # def initialize(name, high_value, low_value, suit, image)
  #   self.name = name
  #   self.high_value = high_value
  #   self.low_value = low_value
  #   self.suit = suit
  #   self.image = image
  # end

end
