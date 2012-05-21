Winloss::Application.routes.draw do
  resources :games, :only => [:index, :create, :destroy]
  root :to => 'games#index'
end
