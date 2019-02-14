Rails.application.routes.draw do
  resources :brands, param: :name do
    resources :lines, param: :name do
      resources :incenses, param: :name do
        resources :reviews, shallow: true
      end
      patch 'approve', to: 'lines#approve'
    end
  end
  patch '/brand/:name/approve', to: 'brands#approve'
end
