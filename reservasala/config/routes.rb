Rails.application.routes.draw do
  resources :usuarios
  root :to => redirect('/usuarios')
  resources :salas
  root :to => redirect('/salas')
  resources :reservas
  root :to => redirect('/reservas')
  match 'reservas_user' => 'reservas#reservas_user', :as => :reservas_user, via: [:get]
  get '/reservas/sala/:id' => 'reservas#reservas_sala', :as => :reservas_sala
end