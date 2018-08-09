Rails.application.routes.draw do
  get 'histories/create'
  get 'watch/watch_alone'
  get 'watch/watch_with_friends'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "dashboard#index"
  
  resources :users,only:[:new,:create,:edit,:update]
  resources :movies do
    collection do
      get 'before_new'
    end
    get "watch_alone",on: :member
    get "watch_with_friends",on: :member
    
    resources :playlist_movies,only:[:create]
    
  end
  
  resources :playlists,only:[:show]
  
  #Dashboard path
  get "dashboard/users",to:"dashboard#user",as: :user_dashboard
  get "dashboard/myhistory",to:"dashboard#my_history",as: :my_history
  get "dashboard/admin",to:"dashboard#admin",as: :admin_dashboard
  post "dashboard/search",to:"dashboard#search",as: :search_dashboard
  
  #Sign in and sign out path
  get "signin",to:"session#new",as: :signin
  post "signin",to: "session#create"
  delete "signout",to:"session#destroy"
  
end
