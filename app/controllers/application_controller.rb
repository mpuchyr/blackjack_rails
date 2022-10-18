class ApplicationController < ActionController::Base
  $my_cards = []
  $comp_cards = []
  $my_score = 0
  $comp_score = 0
  $result = nil

  # variables to determine whether the players can still go
  $player_end = false
  $comp_end = true

  def deal_cards(player_array)
    player_array.push($deck.deal_card)
  end

  def determine_winner
    if $my_score <= 21 && $comp_score <= 21
      if $my_score == $comp_score
        $result = "Tie"
      elsif $my_score == 21 || $my_score > $comp_score
        $result = "Player Wins!"
      elsif $comp_score == 21 || $comp_score > $my_score
        $result = "Dealer Wins!"
      end
    elsif $my_score > 21
      $result = "Player Bust. Dealer Wins!"
    else
      $result = "Dealer Bust. Player Wins!"
    end
  end
  
  
  def index
    # prevents error if card arrays are empty
    if $my_cards.count > 0 && $comp_cards.count > 0
      # reset scores to zero to prevent continual addition if page is refreshed
      $my_score = 0
      $comp_score = 0
      $my_cards.each do |card|
        $my_score += card.value
      end

      $comp_cards.each do |card|
        $comp_score += card.value
      end
    end

    if $my_score >= 21 
      $player_end = true
    end

    if $comp_score >= 21
      $comp_end = true
    end 

    if $comp_end && $player_end
      determine_winner
    end
    render({ :template => "index.html.erb"})
  end

  def new
    $player_end = false
    $comp_end = false

    $deck = Deck.new
    $my_cards = []
    $comp_cards = []

    $comp_score = 0
    $my_score = 0

    $result = nil

    2.times do 
      deal_cards($my_cards)
    end
    2.times do
      deal_cards($comp_cards)
    end
    redirect_to("/")
  end

  def hit
    deal_cards($my_cards)
    if $comp_score < 17 && !$comp_end
      deal_cards($comp_cards)
    end
    redirect_to("/")
  end

  def stay
    $player_end = true
    while $comp_score < 17 && !$comp_end
      deal_cards($comp_cards)
      $comp_cards.each do |card|
        $comp_score += card.value
      end
    end
    $comp_end = true
    redirect_to("/")
  end
end
