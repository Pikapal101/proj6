Rails.application.routes.draw do
	root 'plans#index'
	post '/plans/:plan_id/addcourse/:id(.:format)' => 'plan#addcourse'
	post '/plans/:plan_id/removecourse/:id(.:format)' => 'plan#removecourse'
  resources :courses
  resources :plans
  devise_for :users, :controllers => {:registrations => 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
