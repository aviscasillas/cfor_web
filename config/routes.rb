CforWeb::Application.routes.draw do
  devise_for :users

	resources :users do
		resources :formulas
	end
	get "welcome/index"
  root :to => 'welcome#index'
end
