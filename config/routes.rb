Rails.application.routes.draw do
  scope module: :web do
    resources :users, only: [:new, :create]
    resource :welcome, only: :show
    resource :session, only: [:new, :create, :destroy]
  end
end