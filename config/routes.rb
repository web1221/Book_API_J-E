Rails.application.routes.draw do
    resources :authors do
        resources :books, except: [:index]
    end
end
