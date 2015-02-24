class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

Xlearning::Application.routes.draw do
  #match "/cursos" => "cursos#new", via: :get
  match "/validar_email" => "usuarios#validar_email", via: :post
  match "/validar_subdominio" => "organizacions#validar_subdominio", via: :post
  match "/usuarios/abrircuenta"=>"usuarios#create", via: :post
  devise_scope :usuario do
    post "/entrar" => "devise/sessions#create"
    get "/entrar" => "devise/sessions#new"
    #get "/registro" => "devise/registrations#new"
  end
  devise_for :usuarios, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }, via: :post
  match '/usuarios/:id/confirmar_registro' => 'usuarios#finish_signup', via: [:get, :patch], :as => :finish_signup
  constraints(SubdomainPresent) do
    match "/estructura_oferta_academicas/:id/:todo"=>"estructura_oferta_academicas#destroy", via: :delete
    resources :estructura_oferta_academicas, only: [:index, :create, :new]
    resources :cursos, only: [:index, :create, :show, :destroy]
    resources :rols
    match "/clases/:id" => "clases#index", via: :get
    
    match "/clases/:id_grupo/evaluacion/:id_evaluacion/overview" => "evaluacion_grupos#new", via: :get
    match "/clases/:id_grupo/evaluacion/:id_evaluacion/presentar" => "evaluacion_grupos#new", via: :get
    match "/clases/" => "grupos#index", via: :get
    match "/clases_pasados/" => "grupos#pasados", via: :get
    match "/clases_futuros/" => "grupos#futuros", via: :get
    match "/historial/pagos/" => "pagos#index", via: :get
    match "/historial/pagos/" => "pagos#index", via: :get
    match "/historial/certificados/" => "certificados#index", via: :get
    match "/evaluacion/corregir/" => "evaluacion_grupos#create", via: :post
    match "/biblioteca/" => "objeto_aprendizaje#index", via: :get
  
    match "/usuarios/editar" => "usuarios#edit", via: :get
    match "/usuarios/editar" => "usuarios#save", via: :post
    match "/usuarios/:id" => "usuarios#show", via: :get
    match "/preferencias" => "usuarios#preferencias", via: :get

    match "/clases/:id_clases/asignacion/:id_asignacion/presentar" => "asignacion#presentar", via: :get
    match "/clases/:id_clases/asignacion/:id_asignacion/overview" => "asignacion#overview", via: :get

    match "/estadisticos" => "estadisticos#index_organizacion", via: :get
    match "/estadisticos/editar" => "estadisticos#edit", via: :get
    match "/estadisticos/editar" => "estadisticos#edit", via: :post
    match "/estadisticos/:id/" => "estadisticos#estadistico_general", via: :get
    match "/estadisticos/:id/:grafico" => "estadisticos#estadistico_personalizado", via: :get
    match "/encuestas/" => "encuestas#index", via: :get
    match "/encuestas/nuevo" => "encuestas#nuevo", via: :get
    match "/encuestas/todas" => "encuestas#show", via: :get
    match "/apariencia/editar" => "organizacions#apariencia", via: :get
  
    match "/perfil/editar" => "organizacions#edit_perfil", via: :get
    match "/perfil/editar" => "organizacions#save_perfil", via: :post
    match "/perfil" => "organizacions#perfil", via: :get
    match "/usuarios" => "organizacions#usuarios", via: :get

    match "/biblioteca/nuevo" => "objeto_aprendizaje#new", via: :get
    match "/biblioteca/nuevo" => "objeto_aprendizaje#create", via: :post
    match "/biblioteca/:id/descargar" => "objeto_aprendizaje#descargar_archivo", via: :get
    match "/biblioteca/:id/mostrar" => "objeto_aprendizaje#mostrar_archivo", via: :get
    match "/calendario/facilitador" => "clases#calendario_facilitador", via: :get

    match "/estudiantes" => "organizacions#admision", via: :get
    match "/secciones/facilitador" => "grupos#facilitador_secciones", via: :get
    match "/secciones/coordinador" => "grupos#coordinador_secciones", via: :get
    match "/organizacion/todas" => "organizacions#show", via: :get
    match "/cursos/:id/ver" => "cursos#show", via: :get
    match "/cursos/editar" => "cursos#edit", via: :get
    match "/cursos/editar" => "cursos#edit", via: :post
    match "/cursos/jerarquia" => "cursos#jerarquia", via: :get
    match "/cursos/jerarquia" => "cursos#crear_jerarquia", via: :post
    match '/politicas' => 'grupos#politica_admision', via: :get
    match "/encuestas/modificar/:id" => "encuestas#edit", via: :get


    #Manejo de Ofertas academicas
    resources :oferta_academica, controller: 'oferta_academicas'

      match "/usuario/guardar_foto" => "usuarios#save_foto", via: :post
      match "/usuario/guardar_foto" => "usuarios#save_foto", via: :get
      match "/preferencias" => "usuarios#preferencias_guardar", via: :post
      

       #los json a utilizar
       match "/json/clases/generarClasesActuales" => "grupos#generarClasesActuales", via: :get
       match "/json/clases/generarClasesPasadas" => "grupos#generarClasesPasadas", via: :get
       match "/json/clases/generarClasesFuturas" => "grupos#generarClasesFuturas", via: :get
       match "/json/clases/generarListaDeseos" => "grupos#generarListaDeseos", via: :get
       match "/json/clases/generarListaRecomendados" => "grupos#generarListaRecomendados", via: :get
       match "/json/clases/generarClasesNotificacionesEvaluaciones" => "clases#generarClasesNotificacionesEvaluaciones", via: :post
       match "/json/clases/generarClasesNotificacionesDiscuciones" => "clases#generarClasesNotificacionesDiscuciones", via: :post
       match "/json/clases/generarClasesNotificaciones" => "clases#generarClasesNotificaciones", via: :post
       match "/json/clases/generarClasesCalendarioEstudiante" => "clases#generarClasesCalendarioEstudiante", via: [:post,:get]
       match "/json/clases/generarClasesCalendarioFacilitador" => "clases#generarClasesCalendarioFacilitador", via: :post
  end

  match "/inicio" => "portal#index", via: :get
  match "/registro" => "usuarios#new", via: :get
  
  root 'organizacions#index'
  resources :organizacions
end
