class ApplicationController < ActionController::Base


  def deal_cards(player_array)
    player_array.push($deck.deal_card)
  end
  
  
  def index
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
end
