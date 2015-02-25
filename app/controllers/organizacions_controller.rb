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

  def index
    if request.subdomain.present?
      render "organizacions/perfil"
    else
      render "portal/index"
    end 
  end

  def perfil
   if !usuario_signed_in?
          @valor = false; 
          render "organizacions/perfil"
     else

        @rol =  Rol.where(nombre: 'administrador')
        
        @usuarioRol = UsuarioRol.where(usuario_id: current_usuario.id, rol_id: current_usuario.rol_actual.id) 

        if @usuarioRol[0] == nil or @rol[0].id != current_usuario.rol_actual.id
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

        @organizacion = Organizacion.find_by(subdominio: request.subdomain)
        @rol =  Rol.where(nombre: 'administrador')
        
        @usuarioRol = UsuarioRol.where(usuario_id: current_usuario.id, rol_id: current_usuario.rol_actual.id) 

        if @usuarioRol[0] == nil or @rol[0].id != current_usuario.rol_actual.id
          render "organizacions/perfil"
        else
           @valor = true;
        end
         
     end
    


   end

   def save_perfil

         @organizacion = Organizacion.find_by(subdominio: request.subdomain)
         @organizacion.update(organizacion_params)

              if ! params[:usuario][:perfil_attributes][:googleplus].nil?
                red_social = RedSocial.find_by(nombre: 'googleplus')
              
                organizacionR = OrganizacionRedSocial.where("organizacion_id = ? and red_social_id = ?", 1, red_social.id)
                organizacionR.each do |us|
                  organizacionR = us
                end

                if ! organizacionR.nil?
                  organizacionR.valor = params[:usuario][:perfil_attributes][:googleplus]
                  organizacionR.save
                else 
                  organizacionR = OrganizacionRedSocial.new
                  organizacionR.organizacion_id = 1
                  organizacionR.red_social_id = red_social.id
                  organizacionR.valor = params[:usuario][:perfil_attributes][:googleplus]
                  organizacionR.save
                end
            end

             if ! params[:usuario][:perfil_attributes][:facebook].nil?
                red_social = RedSocial.find_by(nombre: 'facebook')
              
                @organizacionR = OrganizacionRedSocial.where("organizacion_id = ? and red_social_id = ?", 1, red_social.id)
                @organizacionR.each do |us|
                  @organizacionR = us
                end

                if ! organizacionR.nil?
                  @organizacionR.valor = params[:usuario][:perfil_attributes][:facebook]
                  @organizacionR.save
                else 
                  @organizacionR = OrganizacionRedSocial.new
                  @organizacionR.organizacion_id = 1
                  @organizacionR.red_social_id = red_social.id
                  @organizacionR.valor = params[:usuario][:perfil_attributes][:facebook]
                  @organizacionR.save
                end
            end

            if ! params[:usuario][:perfil_attributes][:twitter].nil?
                red_social = RedSocial.find_by(nombre: 'twitter')
              
                @organizacionR = OrganizacionRedSocial.where("organizacion_id = ? and red_social_id = ?", 1, red_social.id)
                @organizacionR.each do |us|
                  @organizacionR = us
                end

                if ! organizacionR.nil?
                  @organizacionR.valor = params[:usuario][:perfil_attributes][:twitter]
                  @organizacionR.save
                else 
                  @organizacionR = OrganizacionRedSocial.new
                  @organizacionR.organizacion_id = 1
                  @organizacionR.red_social_id = red_social.id
                  @organizacionR.valor = params[:usuario][:perfil_attributes][:twitter]
                  @organizacionR.save
                end
            end
      
             if ! params[:usuario][:perfil_attributes][:linkedin].nil?
                red_social = RedSocial.find_by(nombre: 'linkedin')
              
                @organizacionR = OrganizacionRedSocial.where("organizacion_id = ? and red_social_id = ?", 1, red_social.id)
                @organizacionR.each do |us|
                  @organizacionR = us
                end

                if ! organizacionR.nil?
                  @organizacionR.valor = params[:usuario][:perfil_attributes][:linkedin]
                  @organizacionR.save
                else 
                  @organizacionR = OrganizacionRedSocial.new
                  @organizacionR.organizacion_id = 1
                  @organizacionR.red_social_id = red_social.id
                  @organizacionR.valor = params[:usuario][:perfil_attributes][:linkedin]
                  @organizacionR.save
                end
            end

            if ! params[:usuario][:perfil_attributes][:github].nil?
                red_social = RedSocial.find_by(nombre: 'github')
              
                @organizacionR = OrganizacionRedSocial.where("organizacion_id = ? and red_social_id = ?", 1, red_social.id)
                @organizacionR.each do |us|
                  @organizacionR = us
                end

                if ! organizacionR.nil?
                  @organizacionR.valor = params[:usuario][:perfil_attributes][:github]
                  @organizacionR.save
                else 
                  @organizacionR = OrganizacionRedSocial.new
                  @organizacionR.organizacion_id = 1
                  @organizacionR.red_social_id = red_social.id
                  @organizacionR.valor = params[:usuario][:perfil_attributes][:github]
                  @organizacionR.save
                end
            end


            render "organizacions/perfil"
   end


  def apariencia


     if !usuario_signed_in?
         render "organizacions/perfil"
     else

        @rol =  Rol.where(nombre: 'administrador')
        
        @usuarioRol = UsuarioRol.where(usuario_id: current_usuario.id, rol_id: current_usuario.rol_actual.id) 

        if @usuarioRol[0] == nil or @rol[0].id != current_usuario.rol_actual.id
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
        
        @usuarioRol = UsuarioRol.where(usuario_id: current_usuario.id, rol_id: current_usuario.rol_actual.id) 

        if @usuarioRol[0] == nil or @rol[0].id != current_usuario.rol_actual.id
          render "organizacions/perfil"
        else
           @valor = true;
        end
         
     end
   


  end

  def admision

    render "organizacions/clientes_admision"
    
  end

  def show
     @organizacion = Organizacion.find_by(subdominio: request.subdomain) 
    render "organizacions/show"
    
  end


  def save_portada

    dir = "public/systems/"+ request.subdomain + "/portafolio"

     organizacion = Organizacion.find_by(subdominio: request.subdomain) 

      #Archivo subido por el usuario.
        archivo = params[:avatar_portada]
        #Nombre original del archivo.
        nombre = archivo.original_filename


        #Extensión del archivo.
        extension = nombre.slice(nombre.rindex("."), nombre.length).downcase

         #Nombre original del archivo.
        nombre = 'portada' + extension
        
       archivo.original_filename = nombre


         #Ruta del archivo.
         path = File.join(dir, nombre)
         #Crear en el archivo en el directorio. Guardamos el resultado en una variable, será true si el archivo se ha guardado correctamente.
         resultado = File.open(path, "wb") { |f| f.write(archivo.read) }
         #Verifica si el archivo se subió correctamente.

        organizacion.portada = nombre


        organizacion.save

       @organizacion = Organizacion.find_by(subdominio: request.subdomain) 
    render "/organizacions/edit_perfil"
    
  end

  def save_logo

       dir = "public/systems/"+ request.subdomain + "/portafolio"


     organizacion = Organizacion.find_by(subdominio: request.subdomain) 

      #Archivo subido por el usuario.
        archivo = params[:avatar_logo]
        #Nombre original del archivo.
        nombre = archivo.original_filename


        #Extensión del archivo.
        extension = nombre.slice(nombre.rindex("."), nombre.length).downcase

         #Nombre original del archivo.
        nombre = 'logo' + extension
        
       archivo.original_filename = nombre


         #Ruta del archivo.
         path = File.join(dir, nombre)
         #Crear en el archivo en el directorio. Guardamos el resultado en una variable, será true si el archivo se ha guardado correctamente.
         resultado = File.open(path, "wb") { |f| f.write(archivo.read) }
         #Verifica si el archivo se subió correctamente.

        organizacion.logo = nombre

        organizacion.save
    
     @organizacion = Organizacion.find_by(subdominio: request.subdomain) 
    render "/organizacions/edit_perfil"
    
  end

  def validar_subdominio
    if BaseDato.exists?(nombre: params[:usuario][:organizacion_attributes][:subdominio])
      render json: false
    else
      render json: true
    end
  end


  private
      def set_user
        @organizacion = Organizacion.find_by(subdominio: request.subdomain) 
      end

       def usuario_params
        accessible = [ :nombre, :apellido, :email,:organizacion_attributes => [ :id, :nombre, :descripcion, :subdominio,:contratos_attributes => [:id, :plan_id, :frecuencia_pago_id]] ] # extend with your own params
        accessible << [ :password, :password_confirmation ] unless params[:usuario][:password].blank?
        params.require(:usuario).permit(accessible)
      end

        def organizacion_params
          accessible = [ :nombre, :descripcion, :slogan, :pais_id, :email1, :email2, :telefono1, :telefono2 ] # extend with your own params
          accessible << [ :password, :password_confirmation ] unless params[:usuario][:password].blank?
          params.require(:usuario).permit(accessible)
      end

end
