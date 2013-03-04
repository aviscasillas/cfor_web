CforWeb::Application.routes.draw do
  devise_for :users

	resources :users do
		resources :formulas do 
	    member do 
	      get :calculate
	    end 
  	end
	end
	get "welcome/index"
  root :to => 'welcome#index'
end
