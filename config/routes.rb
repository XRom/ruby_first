Rails.application.routes.draw do
  scope module: :web do
    resources :developers, only: [:new, :create]
    resource :welcome, only: :show
    resource :sessions, only: [:new, :create, :destroy, :index]
  end
end