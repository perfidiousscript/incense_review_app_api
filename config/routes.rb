Rails.application.routes.draw do
  resources :brands, shallow: true do
    resources :lines, shallow: true do
      resources :incenses, shallow: true do
        resources :reviews, shallow: true
      end
      member do
        patch 'approve', to: 'lines#approve'
      end
    end
    member do
      patch 'approve', to: 'brands#approve'
    end
  end
end
