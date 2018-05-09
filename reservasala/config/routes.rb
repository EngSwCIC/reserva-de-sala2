Rails.application.routes.draw do
    resources :usuarios
    root :to => redirect('/usuarios')
end