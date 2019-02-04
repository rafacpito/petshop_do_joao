Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  devise_for :users, :path => '', :path_names => { :sign_in => "manager", :sign_out => "manager/logout" }, only: [:sessions]
  resources :schedules, only: [:create, :new, :index]
  scope :manager do
    resources :services, :users
  end
end
