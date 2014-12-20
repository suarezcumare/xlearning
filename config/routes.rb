class SubdomainPresent
	def self.matches?(request)
		request.subdomain.present?
	end
end

Xlearning::Application.routes.draw do
  	constraints(SubdomainPresent) do
	end
	devise_for :usuarios
	root 'portal#index'
	resources :organizacions
end
