Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

  get "/admin" => "admin/homes#top"

  namespace :admin do
  end
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
devise_scope :customer do
  root to: "public/homes#top"
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
