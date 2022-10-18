Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "index"})
  get("/new", {:controller => "application", :action => "new"})
  get("/hit", {:controller => "application", :action => "hit"})

end
