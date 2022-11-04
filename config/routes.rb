Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "index"})
  get("/new", {:controller => "application", :action => "new"})
  get("/hit", {:controller => "application", :action => "hit"})
  get("/stay", {:controller => "application", :action => "stay"})
  get("/load", {:controller => "application", :action => "load_game_from_session"})

end
