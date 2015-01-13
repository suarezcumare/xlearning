class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_db, :load_menu

  @menu
  protected

  def after_sign_in_path_for(resource)
    return "/inicio"
  end

  private
  	def load_db
  		Apartment::Tenant.switch()
  		return unless request.subdomain.present?

  		o = BaseDato.find_by(nombre: request.subdomain)
  		if o
  			Apartment::Tenant.switch(request.subdomain)
  		else
  			redirect_to root_url(subdomain: false)
  		end
  	end

    def load_menu
      if usuario_signed_in?
        @menu = Menu.includes(:opcionmenu).where(opcion_menus: {raiz: true}).where(rol_id: current_usuario.rol_actual.id).first
      end
    end
end
