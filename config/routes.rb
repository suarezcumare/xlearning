class SubdomainPresent
	def self.matches?(request)
		request.subdomain.present?
	end
end

Xlearning::Application.routes.draw do
	get 'cursos' => 'cursos#index'
	match "/validar_email" => "usuario#validar_email", via: :post
	match "/menu" => "menu#find", via: :get
  	constraints(SubdomainPresent) do
  		match "/clases/:id" => "grupos#index", via: :get
  		match "/clases/:id/evaluacion/:id/overview" => "evaluacion#overview", via: :get
  		match "/clases/:id/evaluacion/:id/presentar" => "evaluacion#presentar", via: :get
	end
	devise_for :usuarios, via: :post
	devise_scope :usuario do
  		get "/entrar" => "sessions#create"
	end
	root 'portal#index'
	resources :organizacions
end
