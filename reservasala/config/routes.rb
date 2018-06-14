Rails.application.routes.draw do
  resources :usuarios
  root :to => redirect('/usuarios')
  resources :salas
  root :to => redirect('/salas')

  #testes
  post '/usuarios/login'
end