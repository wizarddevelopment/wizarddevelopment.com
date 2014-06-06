WizardDevelopment::Application.routes.draw do
  root 'home#mvp'
  # get 'business' => 'home#index', format: false
  # get 'devteam' => 'home#index', format: false

  resource :contact_requests, only: [:create], format: false

 get 'team', to: 'home#mvp'
 get 'business', to: 'home#mvp'
 get 'development', to: 'home#mvp'
 get 'contact', to: 'home#mvp'
end
