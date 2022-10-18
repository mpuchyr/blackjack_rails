class ApplicationController < ActionController::Base
  $my_cards = []
  $comp_cards = []

  def deal_cards(player_array)
    player_array.push($deck.deal_card)
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
    render({ :template => "index.html.erb"})
  end

  def new
    $deck = Deck.new
    $my_cards = []
    $comp_cards = []

    $comp_score = 0
    $my_score = 0

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
    if $comp_score < 17
      deal_cards($comp_cards)
    end
    redirect_to("/")
  end

  def stay
    if $comp_score < 17
      deal_cards($comp_cards)
    end
    redirect_to("/")
  end
end
