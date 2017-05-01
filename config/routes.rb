Rails.application.routes.draw do
	root 'plans#index'
	post '/plans/:plan_id/addcourse/:id' => 'plans#addcourse'
	post '/plans/:plan_id/removecourse/:id' => 'plans#removecourse'
	post '/plans/:plan_id/removeyear/:id' => 'plans#removeyear'
	post '/plans/:plan_id/addyear/:id' => 'plans#addyear'
  resources :courses
  resources :plans
  devise_for :users, :controllers => {:registrations => 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
