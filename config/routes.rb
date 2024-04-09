Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/customers/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/posts/searchs' => 'posts#search'
    resources :posts, only: [:index, :new, :create, :show, :edit, :destroy, :update] do
     resource :favorite, only: [:create, :destroy]
     resources :comments, only: [:create, :new, :edit, :update, :destroy, :index]
    end
    

    resources :customers, only: [:edit] 
    
     get '/customers' => 'customers#show'
     get '/customers/confirm_withdraw' => 'customers#confirm_withdraw'
     get '/customers/withdraw' => 'customers#withdraw'
     patch 'customers/update' => 'customers#update', as: 'update_customer'
      
    
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show]
    get '/admin/posts' => 'posts#search'
    patch '/admin/customers/unsubscribe' => 'customers#unsubscribe'
  end
end
