Rails.application.routes.draw do
  root 'welcome#index'

  resources :characters
  resources :gank_sessions do
    post :end, to: 'gank_sessions#end', as: 'end'
    post :loot, to: 'gank_sessions#loot', as: 'loot'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
