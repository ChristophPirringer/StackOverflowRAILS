Rails.application.routes.draw do
  resources :posts do
     resources :answers 
  end
end
