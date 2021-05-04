Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/",{to:"home#home", as: :root})
  resource :home, only:[:home]
  resources :teams, only:[:new,:create,:update,:index,:show,:edit] 
  resources :members, only:[:new,:create,:update,:index,:show,:edit] 
  
  delete("/teams",{to:"teams#destroy"})
  delete("/members",{to:"teams#destroy"})
end
