Rails.application.routes.draw do
resources :users do
resources :bugs
end
end
