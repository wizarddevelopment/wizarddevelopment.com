WizardDevelopment::Application.routes.draw do
  root 'home#index'
  get 'proposal/:client', to: 'proposals#view'
  resource :contact_requests, only: [:create], format: false
end
