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
  		match "/clases/:id" => "grupos#show", via: :get
  		match "/clases/:id/evaluacion/:id/overview" => "evaluacion#overview", via: :get
  		match "/clases/:id/evaluacion/:id/presentar" => "evaluacion#presentar", via: :get
  		match "/clases/" => "grupos#index", via: :get
  		match "/historial/pagos/" => "pagos#index", via: :get
  		match "/historial/certificados/" => "certificados#index", via: :get
 		
  		match "/usuarios/:id" => "usuario#perfil_index", via: :get
  		match "/usuarios/editar/:id" => "usuario#perfil_editar", via: :get
  		match "/estadisticos" => "estadisticos#index_organizacion", via: :get
  		match "/estadisticos/:id" => "estadisticos#estadistico_general", via: :get
      match "/estadisticos/:id/:id" => "estadisticos#estadistico_personalizado", via: :get
	end
	devise_for :usuarios, via: :post
	devise_scope :usuario do
  		post "/entrar" => "devise/sessions#create"
  		get "/entrar" => "devise/sessions#new"
  		get "/registro" => "devise/registrations#new"
	end
	root 'portal#index'
	resources :organizacions
end
