Rails.application.routes.draw do
  resources :links, only: %i(new show create)
end
