Rails.application.routes.draw do
  resources :brands do
    resources :lines, only: [:index, :new, :create] do
      resources :incenses, only: [:index, :new, :create]
      get 'approve', to: 'lines#approve'
    end
  end
  resources :lines, only: [:show, :edit, :update, :destroy]
  resources :incenses, only: [:show, :edit, :update, :destroy]
  get '/brands/:id/approve', to: 'brands#approve'

end
