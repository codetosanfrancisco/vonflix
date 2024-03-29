Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "dashboard#index"
  
  resources :users,only:[:new,:create,:edit,:update]
  resources :movies do
    collection do
      get 'before_new'
      get 'friends_watching'
      get 'who_is_my_friends'
      get 'edit_or_delete'
      get 'play'
      get 'pause'
      get 'playback'
      get 'progress'
    end
    member do
      get 'create_invitation'
      get 'accept_invitation'
      get "watch_alone"
      get "watch_with_friends"
      post "verify_invitation"
      get "watch_together"
      get "destroy_photo"
      get "destroy_video"
    end
    resources :playlist_movies,only:[:create]
  end
  
  resources :playlists,only:[:show]
  resources :messages,only:[:create]
  #Dashboard path
  get "dashboard/users",to:"dashboard#user",as: :user_dashboard
  get "dashboard/myhistory",to:"dashboard#my_history",as: :my_history
  get "dashboard/admin",to:"dashboard#admin",as: :admin_dashboard
  post "dashboard/search",to:"dashboard#search",as: :search_dashboard
  
  #Sign in and sign out path
  get "signin",to:"session#new",as: :signin
  post "signin",to: "session#create"
  delete "signout",to:"session#destroy"
  
  mount ActionCable.server, at: '/cable'
end
