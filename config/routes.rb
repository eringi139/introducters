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
    resources :posts, only: [:index, :new, :create, :show, :edit, :destroy]
    resources :customers, only: [:edit]
    get '/customers' => 'customers#show'
    get '/customers/confirm_withdraw' => 'customers#confirm_withdraw'
    get '/customers/withdraw' => 'customers#withdraw'
    get '/posts/searchs' => 'posts#search'
    patch 'posts/update' => 'posts#update', as: 'update_post'
    patch 'customers/update' => 'customers#update', as: 'update_customer'
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :posts, only: [:index, :show]
    get '/admin/posts' => 'posts#search'
  end
end
