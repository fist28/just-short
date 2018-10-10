Rails.application.routes.draw do
  get '/:id', to: 'links#redirect', constraints: { id: /[a-zA-Z\d]{8}/ }
  resources :links, only: %i(new show create)
end
