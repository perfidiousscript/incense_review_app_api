Rails.application.routes.draw do
  resources :brands, param: :name do
    resources :lines, param: :name, shallow: true do
      resources :incenses, param: :name, shallow: true
      patch 'approve', to: 'lines#approve'
    end
  end
  patch '/brand/:name/approve', to: 'brands#approve'
end
