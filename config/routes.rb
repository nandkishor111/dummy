Rails.application.routes.draw do
  

  get 'home/index'
  # resources :tags, except: :show
  
  get 'posts/index'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', confirmations: 'confirmations',registrations: 'registrations'  }
  
  get 'change_role', to: 'users#change_role'  
  get 'receive_request', to: 'admin#receive_request'
  get 'tags/:tag', to: 'posts#index',as: "tag"
  
  resources :users do
    member do
      get :password_change 
      post :allow_notification    
    end  
  end 

  resources :admin do 
      member do
        post :approve_post
        post :request_confirm
      end
  end      
   
    resources :approveroles do
      member do
        post :request_confirm
      end
    end
    
   
    resources :posts do
      resources :tags   

      resources :images
   	  resources :comments do
        member do
          post :like_comment
        end 
   	  end
   	 resources :likes
    end 	 

   root "home#index"
   
  

   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
