Rails.application.routes.draw do
  get '/:id', to: 'links#redirect'
  resources :links, only: %i(new show create)
end
