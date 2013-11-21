LabSquares::Application.routes.draw do
  

  authenticated :user do
    root :to => "jumpsquares#index"
  end
  
  unauthenticated :user do
    devise_scope :user do 
      get "/" => "static_pages#home"
    end
  end
  
  devise_for :users, :path_names => { :sign_up => "register"}
  
  resources :jumpsizes
  resources :users
  resources :tags
  resources :apptype_requests
  
  get "static_pages/help"
  get "static_pages/about"
  get "static_pages/contact"
  get "static_pages/settings"
  get "static_pages/home"
  
  resources :jumpsquares do
    member {get "createrdpfile"}
  end
  
  resources :apptypes
  match '/help', to: 'static_pages#help', via: 'get', as: :help
  match '/contact', to: 'static_pages#contact', via: 'get', as: :contact
  match '/about', to: 'static_pages#about', via: 'get', as: :about
  match '/jumpsquares', to: 'jumpsquares#index', via: 'get', as: :userroot
  match 'admin_dashboard/admindashboard', to: 'admin_dashboard#admindashboard', via: 'get', as: :admindashboard
  post 'users/:id/makeadmin' => 'users#makeadmin', as: :makeadmin
  post 'users/:id/removeadmin' => 'users#removeadmin', as: :removeadmin

  match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user
 
end
