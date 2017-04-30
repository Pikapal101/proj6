Rails.application.routes.draw do
	root 'plans#index'
	match '/plans/:plan_id/addcourse/:id', to: 'term#addcourse', via: [:post]
	match '/plans/:plan_id/removecourse/:id', to: 'term#removecourse', via: [:post]
  resources :courses
  resources :plans
  devise_for :users, :controllers => {:registrations => 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
