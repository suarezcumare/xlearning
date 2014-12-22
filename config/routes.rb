class SubdomainPresent
	def self.matches?(request)
		request.subdomain.present?
	end
end

Xlearning::Application.routes.draw do

	match "/usuarios/validar_email" => "usuarios#validaremail", via: :post
  	constraints(SubdomainPresent) do
  		match "/clases/:id" => "grupos#index", via: :get
	end
	devise_for :usuarios
	root 'portal#index'
	resources :organizacions
end
