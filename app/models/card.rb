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
end
