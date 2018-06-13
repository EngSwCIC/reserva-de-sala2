Rails.application.routes.draw do
  resources :usuarios
  root :to => redirect('/usuarios')
  resources :salas
  root :to => redirect('/salas')
  resources :reservas
  root :to => redirect('/reservas')
end