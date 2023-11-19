Rails.application.routes.draw do

devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
end

# 顧客用
# URL /customers/sign_in ...
devise_for :users, skip: [:passwords], controllers: {
  registrations: 'users/registrations',
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
    get '/' => 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :post_comments, only: [:index, :destroy]
    resources :recipes, only: [:index, :show, :edit, :update, :destroy]
    resources :genres
end

scope module: :public do
    root to: 'homes#top'
    get "/search" => "searches#search"
    get '/about' => 'homes#about'
    resources :users do
      member do
        get :favorites
      end
    end

    resources :recipes do
      resource :favorite, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :genres
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
