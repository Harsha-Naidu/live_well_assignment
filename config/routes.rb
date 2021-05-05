Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/",{to:"home#home", as: :root})
  resource :home, only:[:home]
  resources :teams 
  resources :members 
  
  delete("/teams",{to:"teams#delete"})
  delete("/members",{to:"members#delete"})
end
