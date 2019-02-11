Rails.application.routes.draw do
  resources :brands, param: :name do
    resources :lines, param: :name, only: [:index, :new, :create] do
      resources :incenses, param: :name, only: [:index, :new, :create]
      get 'approve', to: 'lines#approve'
    end
  end
  resources :lines, param: :line_name, only: [:show, :edit, :update, :destroy]
  resources :incenses, param: :name, only: [:show, :edit, :update, :destroy]
  patch '/brand/:name/approve', to: 'brands#approve'
end
