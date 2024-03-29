Rails.application.routes.draw do


  namespace :admin do
    get 'posts/index'
    get 'posts/search'
    get 'posts/show'
  end
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
    resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    get '/posts/searchs' => 'posts#search'
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
end
