Rails.application.routes.draw do
  resources :usuarios
  root :to => redirect('/usuarios')
  resources :reservas
  root :to => redirect('/reservas')
end