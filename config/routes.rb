WizardDevelopment::Application.routes.draw do
  root 'home#index'
  get 'proposal/biencuit', to: 'home#bien_cuit'
  resource :contact_requests, only: [:create], format: false

end
