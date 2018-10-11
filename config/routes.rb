Rails.application.routes.draw do
  root 'links#new'
  get '/:id', to: 'links#redirect', constraints: { id: /[a-zA-Z\d]{8}/ }
  resources :links, only: %i(new show create)
  get '*path', to: redirect('/')
end
