Euro2012::Application.routes.draw do

  match 'signin',   :to => 'sessions#new'
  match 'signout',  :to => 'sessions#destroy'
  
  match 'about',    :to => 'pages#about'
  match 'home',     :to => 'pages#home'
  match 'style',    :to => 'pages#style'     # testpage for styles (css)
  
  resource :session, :only => [:new, :create, :destroy]

  resources :jobs do
    get 'calc',     :on => :collection
    get 'export',   :on => :collection
    get 'keys',     :on => :collection
    get 'wipe_out', :on => :collection
  end
  
  resource :import, :only => [:create]

  resources :tips, :only => [:index]  # todo: move to games/and games to admin_games
  
  resources :users
  resources :rounds
  resources :games
  resources :teams
  resources :plays
  
  resources :events do
    post 'add_team_to', :on => :member
  end
  
  resources :pools do
    get 'add_player_to', :on => :member
    resources :players, :only => [:show, :edit]
  end

  root :to => 'pages#home'
end
