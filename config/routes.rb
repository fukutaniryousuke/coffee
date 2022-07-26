Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

  get "/admin" => "admin/homes#top"

  namespace :admin do
    resources :ganres, only:[:index, :create, :edit, :update]
    resources :products, only:[:index, :new, :show, :edit, :create, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  end


  devise_scope :customer do
  root to: "public/homes#top"
  get "/customers/my_page" => "public/customers#show", as: "my_page"
  get "/customers/edit" => "public/customers#edit", as: "edit_customers"
  patch "customers" => "public/customers#update"
  resources :shipping_addresses, only:[:index, :edit, :create, :update, :destroy], controller: "public/shipping_addresses"
  resources :products, only:[:index, :show], controller: "public/products"

end
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end