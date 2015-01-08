# app/controllers/sessions_controller.rb
 
class MenuController < ApplicationController
  def find
    menu = Menu.includes(:opcionmenu).where(opcion_menus: {raiz: true}).where(rol_id: current_usuario.rol_actual.id).first
    usuario = Usuario.includes(:rols).find(1)
    #render json: usuario
    render json: menu.to_json(:include => :opcionmenu)
  end
end