class ApplicationController < ActionController::Base

  #global variables
  $my_cards = []
  $comp_cards = []
  $my_score = 0
  $comp_score = 0
  $result = nil
  $deck = Deck.new
  
  # variables to determine whether the players can still go
  $player_end = false
  $comp_end = false


  # resets all global variables for new game
  def new_game_setup
    #global variables
    $my_cards = []

    $comp_cards = []

    $my_score = 0

    $comp_score = 0

    $result = nil



    # variables to determine whether the players can still go
    $player_end = false


    $comp_end = false



    $deck = Deck.new

  end


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

  def calculate_score
    # reset scores to zero to prevent continual addition if page is refreshed
    $my_score = 0
    $comp_score = 0
    $my_cards.each do |card|
      if $my_score <= 10
        $my_score += card.high_value
       else
        $my_score += card.low_value
      end
    end

    $comp_cards.each do |card|
      if $comp_score <= 10
        $comp_score += card.high_value
      else
        $comp_score += card.low_value
      end
    end
  end

  def save_game_in_session
    session.store(:player_score, $player_score)
    session.store(:comp_score, $comp_score)

    session.store(:deck, $deck.cards)
    p_cards_to_save = []
    $my_cards.each do |card|
      p_cards_to_save.push(card.id)
    end
    session.store(:player_cards, p_cards_to_save)

    c_cards_to_save = []
    $comp_cards.each do |card|
      c_cards_to_save.push(card.id)
    end
    session.store(:comp_cards, c_cards_to_save)

  end

  def load_game_from_session
    $my_score = session.fetch(:player_score)
    $comp_score = session.fetch(:comp_score)

    saved_deck = session.fetch(:deck)
    $deck = Deck.new(saved_deck.cards)

    saved_p_cards = session.fetch(:player_cards)
    saved_p_cards.each do |card_id|
      $player_cards.push(Card.where(:id => card_id))
    end

    saved_c_cards = session.fetch(:comp_cards)
    saved_c_cards.each do |card_id|
      $comp_cards.push(Card.where(:id => card_id))
    end
  end

  
  def index
    
    # prevents error if card arrays are empty
    if $my_cards.count > 0 && $comp_cards.count > 0
      calculate_score
    end


    if $comp_score >= 21 || $my_score >= 21
      $comp_end = true
      $player_end = true
    end 

    if $comp_end && $player_end
      determine_winner
    end
    render({ :template => "index.html.erb"})
  end

  def new
    new_game_setup

    2.times do 
      deal_cards($my_cards)
    end
    2.times do
      deal_cards($comp_cards)
    end

    save_game_in_session

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
        if $comp_score <= 10
          $comp_score += card.high_value
        else
          $comp_score += card.low_value
        end
      end
    end
    $comp_end = true
    redirect_to("/")
  end
end
