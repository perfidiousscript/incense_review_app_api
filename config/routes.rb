Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :brands, shallow: true do
    resources :lines, shallow: true do
      resources :incenses, shallow: true do
        resources :reviews, shallow: true
      end
      member do
        patch 'approve', to: 'lines#approve'
      end
      collection do
        get 'index_unapproved', to: 'lines#index_unapproved'
      end
    end
    member do
      patch 'approve', to: 'brands#approve'
      get 'incenses', to: 'brands#incenses'
    end
    collection do
      get 'index_unapproved', to: 'brands#index_unapproved'
    end
  end
end
