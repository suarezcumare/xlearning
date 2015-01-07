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

  
   if !usuario_signed_in?
          @valor = false; 
     else

        @rol =  Rol.where(nombre: 'administrador')
        
        @usuarioRol = UsuarioRol.where(usuario_id: current_usuario.rol_actual.id, rol_id: @rol[0].id) 

        if @usuarioRol[0] == nil
          @valor = false;
        else
           @valor = true;
        end
         
     end

  end


  def edit_perfil

     if !usuario_signed_in?
         render "organizacions/perfil"
     else

        @rol =  Rol.where(nombre: 'administrador')
        
        @usuarioRol = UsuarioRol.where(usuario_id: current_usuario.rol_actual.id, rol_id: @rol[0].id) 

        if @usuarioRol[0] == nil
          render "organizacions/perfil"
        else
           @valor = true;
        end
         
     end
    


   end


  def apariencia


     if !usuario_signed_in?
         render "organizacions/perfil"
     else

        @rol =  Rol.where(nombre: 'administrador')
        
        @usuarioRol = UsuarioRol.where(usuario_id: current_usuario.rol_actual.id, rol_id: @rol[0].id) 

        if @usuarioRol[0] == nil
          render "organizacions/perfil"
        else
           @valor = true;
        end
         
     end


  end

  def usuarios

    if !usuario_signed_in?
         render "organizacions/perfil"
     else

        @rol =  Rol.where(nombre: 'administrador')
        
        @usuarioRol = UsuarioRol.where(usuario_id: current_usuario.rol_actual.id, rol_id: @rol[0].id) 

        if @usuarioRol[0] == nil
          render "organizacions/perfil"
        else
           @valor = true;
        end
         
     end
   


  end


end
