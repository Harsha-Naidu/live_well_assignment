Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/",{to:"home#home", as: :root})
  resource :home, only:[:home]
  resources :teams do
    resources :members
  end

end
