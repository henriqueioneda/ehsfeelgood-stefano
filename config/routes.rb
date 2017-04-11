Rails.application.routes.draw do
  root 'services#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :hirers
  resources :suppliers
  resources :services
  resources :budgets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'hire/:service_id' => 'services#hire', as: :hire
end
