class SubdomainPresent
	def self.matches?(request)
		request.subdomain.present?
	end
end

Xlearning::Application.routes.draw do
  	constraints(SubdomainPresent) do
  		devise_for :usuarios
	end
	root 'portal#index'
	resources :organizacions
end
