Rails.application.routes.draw do
 
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

scope module: :public do
  post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  root to: 'homes#top'
  get '/about' => 'homes#about'
end
end
