Winloss::Application.routes.draw do
  resources :games, :only => [:index, :create]
  root :to => 'games#index'
end
