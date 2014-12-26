# app/controllers/sessions_controller.rb
 
class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    if usuario_signed_in?
      redirect_to root_url
    else
      render json: {"code"=>0, "mensaje"=>"Email o contraseña incorrecta."}
    end
  end
end