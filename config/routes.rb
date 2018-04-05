Rails.application.routes.draw do
root 'home#index'
resources :users do
resources :bugs
end
end
