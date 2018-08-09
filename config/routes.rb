Rails.application.routes.draw do
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
  end
  
  #Dashboard path
  get "dashboard/users",to:"dashboard#user",as: :user_dashboard
  get "dashboard/admin",to:"dashboard#admin",as: :admin_dashboard
  
  #Sign in and sign out path
  get "signin",to:"session#new",as: :signin
  post "signin",to: "session#create"
  delete "signout",to:"session#destroy"
  
end
