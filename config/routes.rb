Rails.application.routes.draw do
  devise_for :admins,
    path: 'admin',
    skip: :registrations,
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    },
    controllers: {
      sessions: 'admin/sessions',
    }

  root 'projects#index'

  resources :projects, only: :show

  namespace :admin do
    root 'application#home'

    resources :projects, only: [:index, :show, :new, :create, :update]

    resources :content_images, only: [:index, :create, :destroy]
  end
end
