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
     resources :post_comments, only: [:create, :new, :edit, :update, :destroy, :index]
    end
    

    resources :customers, only: [:edit, :show] do
     get '/confirm_withdraw' => 'customers#confirm_withdraw'
     get '/withdraw' => 'customers#withdraw'
     patch '/update' => 'customers#update', as: 'update_customer'
      member do
       get :get_favorites 
      end
    end
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show]
    get '/admin/posts' => 'posts#search'
    patch '/admin/customers/unsubscribe' => 'customers#unsubscribe'
  end
end
