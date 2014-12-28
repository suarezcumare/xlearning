# app/controllers/sessions_controller.rb
 
class MenuController < ApplicationController
  def find
    menu = Menu.includes(:opcionmenu).where(opcion_menus: {raiz: true}).find(1)
    usuario = Usuario.includes(:usuario_rols).first
    render json: usuario.usuario_rols
    #render json: menu.to_json(:include => { :opcionmenu => { :include => :hijos}})
  end
end