WizardDevelopment::Application.routes.draw do
  root 'home#index'
  get 'business' => 'home#index', format: false
  get 'devteam' => 'home#index', format: false

  resource :contact_requests, only: [:create], format: false

  get 'mvp' => 'home#mvp', format: false
end
