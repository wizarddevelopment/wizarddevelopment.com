WizardDevelopment::Application.routes.draw do
  root 'home#index'
  get 'clients/:client/proposal', to: 'proposals#view' if Rails.env.development?
  get 'clients/:client/contract', to: 'contracts#view' if Rails.env.development?
  resource :contact_requests, only: [:create], format: false
end
