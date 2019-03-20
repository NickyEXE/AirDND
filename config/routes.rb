Rails.application.routes.draw do
  get '/characters/:id/kill_unkill', to: "characters#kill_unkill"
  get '/parties/:id/tinder', to: "parties#tinder"
  patch '/parties/:id/:id2', to: "characters#draft_or_fire"
  resources :characters
  resources :parties, only: [:show, :index, :new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


#{roadtrip_params[:user_id]}
