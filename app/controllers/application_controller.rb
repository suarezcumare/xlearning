class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_db

  private
  	def load_db
  		Apartment::Tenant.switch()
  		return unless request.subdomain.present?

  		o = Organizacion.find_by(subdominio: request.subdomain)
  		if o
  			Apartment::Tenant.switch(request.subdomain)
  		else
  			redirect_to root_url(subdomain: false)
  		end
  	end
end
