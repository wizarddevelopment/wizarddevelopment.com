WizardDevelopment::Application.routes.draw do
  root 'home#index'
  resource :contact_requests, only: [:create], format: false
  get :bakecycle, to: 'home#bakecycle'
  get :clients, to: 'home#clients'
  get :winnower, to: 'home#winnower'

  # what do we do with these?
  if Rails.env.development?
    get :accounting, to: 'accounting#index'
    get 'clients/:client/proposal', to: 'proposals#view'
    get 'clients/:client/contract', to: 'contracts#view'
  end
end
