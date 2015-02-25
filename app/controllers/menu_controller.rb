# app/controllers/sessions_controller.rb
 
class MenuController < ApplicationController
    before_action :authenticate_usuario!
  def find
    #menu = Menu.includes(:opcionmenu).where(opcion_menus: {raiz: true}).where(rol_id: current_usuario.rol_actual.id).first
    #usuario = Usuario.includes(:rols).find(1)
    #@estructuras = EstructuraOfertaAcademica.top_level do |e|
    #	e.self_y_descendientes!
    #end #self_y_descendientes
    #render json: usuario
    rols = Rol.all
    render json: @rols.to_json()
  end
end