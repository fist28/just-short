Rails.application.routes.draw do
  get '/:id', to: 'application#redirect'
  resources :links, only: %i(new show create)
end
