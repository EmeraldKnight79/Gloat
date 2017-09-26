Rails.application.routes.draw do
  resources :characters
  resources :gank_sessions do
    post :end, to: 'gank_sessions#end', as: 'end'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
