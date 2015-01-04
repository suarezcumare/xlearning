=begin
  organizacions_controller.rb

  Laboratorio III. Dreamteam B. / Ejecutivo Desktop 

  Proyecto  : Xlearning 
  
      Autores :     C.I         Email
    Asaro Guillermo   C.I.: 20.010.162  guillermoasaro@gmail.com
  Bravo Jhosedith   C.I.: 20.237.969  jhosedithbravo.23@gmail.com
  Maldonado Carlex  C.I.: 22.331.306  c.valentinamm@gmail.com
  Suarez Tony     C.I.: 20.671.198  suarezcumare@gmail.com

  
  Ultima Modificación, Fecha  : 07 de enero del 2015
=end


class OrganizacionsController < ApplicationController
 

  def perfil

    @usuario = Usuario.new
    @rol = Rol.new
    @rol =  Rol.where(nombre: 'administrador')
    
    
   if usuario_signed_in?
      @usuarioRol = UsuarioRol.new
      @usuarioRol = UsuarioRol.where(usuario_rol: current_usuario.rol_actual.id, rol_id: @rol[0] ) 

         if @usuarioRol.nil?
            @usuario.id = current_usuario.id
        else
             @usuario = nil
        end

    else
       @usuarioRol = @usuario = nil
    end


   

  end


  def edit_perfil


    @usuario = Usuario.new
    @rol = Rol.new
    @rol =  Rol.where(nombre: 'administrador')
    
    
   if usuario_signed_in?
      @usuarioRol = UsuarioRol.new
      @usuarioRol = UsuarioRol.where(usuario_rol: current_usuario.rol_actual.id, rol_id: @rol[0] ) 

         if @usuarioRol.nil?
            @usuario.id = current_usuario.id
            render "/organizacions/edit_perfil"
        else
             @usuario = nil
             render "/organizacions/perfil" 
        end

    else
       @usuarioRol = @usuario = nil
       render "/organizacions/perfil" 
    end


   end


  def apariencia



    @usuario = Usuario.new
    @rol = Rol.new
    @rol =  Rol.where(nombre: 'administrador')
    
    
   if usuario_signed_in?
      @usuarioRol = UsuarioRol.new
      @usuarioRol = UsuarioRol.where(usuario_rol: current_usuario.rol_actual.id, rol_id: @rol[0] ) 

         if @usuarioRol.nil?
            @usuario.id = current_usuario.id
            render "/organizacions/apariencia"
        else
             @usuario = nil
             render "/organizacions/perfil"
        end

    else
       @usuarioRol = @usuario = nil
       render "/organizacions/perfil" 
    end


  end


  def politicas

     @usuario = Usuario.new
    @rol = Rol.new
    @rol =  Rol.where(nombre: 'administrador')
    
    
   if usuario_signed_in?
      @usuarioRol = UsuarioRol.new
      @usuarioRol = UsuarioRol.where(usuario_rol: current_usuario.rol_actual.id, rol_id: @rol[0] ) 

         if @usuarioRol.nil?
            @usuario.id = current_usuario.id
        else
             @usuario = nil
        end

    else
       @usuarioRol = @usuario = nil
    end


  end


end
