WizardDevelopment::Application.routes.draw do
  root 'home#index'
  resource :contact_requests, only: [:create], format: false

  # what do we do with these?
  if Rails.env.development?
    get 'clients/:client/proposal', to: 'proposals#view'
    get 'clients/:client/contract', to: 'contracts#view'
  end
end
