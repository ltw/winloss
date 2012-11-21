Winloss::Application.routes.draw do
  resources :games, :only => [:index, :create, :destroy]
  resources :users, :only => [:index], defaults: { format: 'json' }
  root :to => 'games#index'
end
