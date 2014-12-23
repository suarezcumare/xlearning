class SubdomainPresent
	def self.matches?(request)
		request.subdomain.present?
	end
end

Xlearning::Application.routes.draw do

	match "/usuarios/validar_email" => "usuarios#validaremail", via: :post
  	constraints(SubdomainPresent) do
  		match "/clases/:id" => "grupos#index", via: :get
  		match "/clases/:id/evaluacion/:id/overview" => "evaluacion#overview", via: :get
  		match "/clases/:id/evaluacion/:id/presentar" => "evaluacion#presentar", via: :get
	end
	devise_for :usuarios, via: :post
	root 'portal#index'
	resources :organizacions
end
