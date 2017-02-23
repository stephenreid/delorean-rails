Delorean::Engine.routes.draw do
  resources :flux_capacitor, only: %w(index) do
    collection do
      post :start
      post :pause
      post :flux
      post :accelerate_to_eighty_eight
    end
  end
  root to: 'flux_capacitor#index'
end
