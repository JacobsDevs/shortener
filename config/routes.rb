Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
	root "link#index"

	get "/links", to: "link#index"
	get "/links/new", to: "link#new"
	get "/links/:shortlink", to: "link#show"
	get "/links/edit/:shortlink", to: "link#edit"
	post "/links/create", to: "link#create"
	patch "/links/update",to: "link#update"
	get "/:shortlink", to: "link#redirect"

	get "/visitors/:id", to: "visitor#show"

	get "/customers/new", to: "customer#new"
	post "/customers/create", to: "customer#create"
	get "/customers/:id", to: "customer#show"

	get "/landing_page/new", to: "landing_page#new"
	get "/landing_page/show/:id", to: "landing_page#show"
	get "/landing_page/:id", to: "landing_page#form"
	post "/landing_page/create", to: "landing_page#create"
	post "/landing_page/create/add_text_field", to: "landing_page#add_text_field"
	post "/landing_page/submit", to: "landing_page#submit"
end
