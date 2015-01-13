class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

Xlearning::Application.routes.draw do

    get 'cursos/:id/ver' => 'cursos#show'
    get 'cursos' => 'cursos#index'
    match "/validar_email" => "usuario#validar_email", via: :post
    match "/menu" => "menu#find", via: :get
    constraints(SubdomainPresent) do
      match "/clases/:id" => "clases#index", via: :get
      match "/clases/:id/evaluacion/:id/overview" => "evaluacion#overview", via: :get
      match "/clases/:id/evaluacion/:id/presentar" => "evaluacion#presentar", via: :get
      match "/clases/" => "grupos#index", via: :get
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
      match "/calendario/facilitador" => "clases#calendario_facilitador", via: :get

      match "/estudiantes" => "organizacions#admision", via: :get
      match "/secciones/facilitador" => "grupos#facilitador_secciones", via: :get
      match "/secciones/coordinador" => "grupos#coordinador_secciones", via: :get
       match "/organizacion/todas" => "organizacions#show", via: :get


  end

  match "/inicio" => "portal#index", via: :get
  match "/registro" => "usuarios#new", via: :get
  devise_for :usuarios, via: :post
  devise_scope :usuario do
      post "/entrar" => "devise/sessions#create"
      get "/entrar" => "devise/sessions#new"
      #get "/registro" => "devise/registrations#new"
  end
  root 'organizacions#index'
  resources :organizacions
end
