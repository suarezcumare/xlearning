# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141218044838) do

  create_table "archivo_objeto_aprendizajes", force: true do |t|
    t.binary   "archivo"
    t.integer  "usuario_id"
    t.datetime "fechasubido"
    t.integer  "licencia_id"
    t.integer  "tipo_formato_id"
    t.integer  "dispositivo_id"
    t.integer  "objeto_aprendizaje_id"
  end

  add_index "archivo_objeto_aprendizajes", ["dispositivo_id"], name: "index_archivo_objeto_aprendizajes_on_dispositivo_id", using: :btree
  add_index "archivo_objeto_aprendizajes", ["licencia_id"], name: "index_archivo_objeto_aprendizajes_on_licencia_id", using: :btree
  add_index "archivo_objeto_aprendizajes", ["objeto_aprendizaje_id"], name: "index_archivo_objeto_aprendizajes_on_objeto_aprendizaje_id", using: :btree
  add_index "archivo_objeto_aprendizajes", ["tipo_formato_id"], name: "index_archivo_objeto_aprendizajes_on_tipo_formato_id", using: :btree
  add_index "archivo_objeto_aprendizajes", ["usuario_id"], name: "index_archivo_objeto_aprendizajes_on_usuario_id", using: :btree

  create_table "asignacion_grupos", force: true do |t|
    t.datetime "fecha_habilitacion"
    t.datetime "fecha_cierre"
    t.integer  "grupo_id"
    t.integer  "asignacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asignacion_grupos", ["asignacion_id"], name: "index_asignacion_grupos_on_asignacion_id", using: :btree
  add_index "asignacion_grupos", ["grupo_id"], name: "index_asignacion_grupos_on_grupo_id", using: :btree

  create_table "asignacions", force: true do |t|
    t.string  "titulo"
    t.text    "descripcion"
    t.text    "instrucciones"
    t.float   "puntuacion",    limit: 24
    t.integer "curso_id"
  end

  add_index "asignacions", ["curso_id"], name: "index_asignacions_on_curso_id", using: :btree

  create_table "base_datos", id: false, force: true do |t|
    t.string "nombre", limit: 200, null: false
  end

  create_table "categoria", force: true do |t|
    t.string "nombre"
    t.text   "descripcion"
  end

  create_table "contenidos", force: true do |t|
    t.integer "orden"
    t.integer "modulo_id"
    t.integer "objeto_aprendizaje_id"
  end

  add_index "contenidos", ["modulo_id"], name: "index_contenidos_on_modulo_id", using: :btree
  add_index "contenidos", ["objeto_aprendizaje_id"], name: "index_contenidos_on_objeto_aprendizaje_id", using: :btree

  create_table "critica_cursos", force: true do |t|
    t.text    "contenido"
    t.float   "puntuacion", limit: 24
    t.integer "autor_id"
    t.integer "curso_id"
  end

  add_index "critica_cursos", ["autor_id"], name: "index_critica_cursos_on_autor_id", using: :btree
  add_index "critica_cursos", ["curso_id"], name: "index_critica_cursos_on_curso_id", using: :btree

  create_table "curso_categoria", force: true do |t|
    t.integer "categoria_id"
    t.integer "curso_id"
  end

  add_index "curso_categoria", ["categoria_id"], name: "index_curso_categoria_on_categoria_id", using: :btree
  add_index "curso_categoria", ["curso_id"], name: "index_curso_categoria_on_curso_id", using: :btree

  create_table "cursos", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.text     "objetivos"
    t.text     "prerequisitos"
    t.text     "perfil_estudiante"
    t.integer  "pago"
    t.float    "costo",              limit: 24
    t.integer  "matricula_maxima"
    t.float    "puntaje_aprobacion", limit: 24
    t.integer  "horas_semanales"
    t.integer  "estatus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dispositivos", force: true do |t|
    t.string "nombre"
  end

  create_table "entrega_asignacions", force: true do |t|
    t.text     "comentario"
    t.float    "puntuacion",         limit: 24
    t.datetime "fecha_subido"
    t.binary   "archivo"
    t.integer  "estatus"
    t.text     "feedback"
    t.integer  "asignaciongrupo_id"
    t.integer  "tipoformato_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entrega_asignacions", ["asignaciongrupo_id"], name: "index_entrega_asignacions_on_asignaciongrupo_id", using: :btree
  add_index "entrega_asignacions", ["tipoformato_id"], name: "index_entrega_asignacions_on_tipoformato_id", using: :btree
  add_index "entrega_asignacions", ["usuario_id"], name: "index_entrega_asignacions_on_usuario_id", using: :btree

  create_table "evaluacion_grupos", force: true do |t|
    t.datetime "fecha_habilitacion"
    t.datetime "fecha_cierre"
    t.integer  "evaluacion_id"
    t.integer  "grupo_id"
  end

  add_index "evaluacion_grupos", ["evaluacion_id"], name: "index_evaluacion_grupos_on_evaluacion_id", using: :btree
  add_index "evaluacion_grupos", ["grupo_id"], name: "index_evaluacion_grupos_on_grupo_id", using: :btree

  create_table "evaluacion_presentadas", force: true do |t|
    t.float    "puntuacion",          limit: 24
    t.datetime "fecha_presentacion"
    t.text     "feedback"
    t.integer  "usuario_id"
    t.integer  "evaluacion_grupo_id"
  end

  add_index "evaluacion_presentadas", ["evaluacion_grupo_id"], name: "index_evaluacion_presentadas_on_evaluacion_grupo_id", using: :btree
  add_index "evaluacion_presentadas", ["usuario_id"], name: "index_evaluacion_presentadas_on_usuario_id", using: :btree

  create_table "evaluacions", force: true do |t|
    t.integer "curso_id"
    t.string  "titulo"
    t.text    "descripcion"
    t.integer "duracion",                            default: -1
    t.boolean "estatus",                             default: true
    t.integer "maxintentos",                         default: 1
    t.integer "cant_preguntas_cerradas"
    t.integer "cant_preguntas_abiertas"
    t.float   "valor_preguntas_abiertas", limit: 24
    t.float   "valor_preguntas_cerradas", limit: 24
    t.float   "puntuacion",               limit: 24
    t.boolean "tipo"
  end

  add_index "evaluacions", ["curso_id"], name: "index_evaluacions_on_curso_id", using: :btree

  create_table "grupos", force: true do |t|
    t.date    "fecha_inicio"
    t.date    "fecha_fin"
    t.date    "cierre_inscripcion"
    t.integer "estatus"
    t.integer "curso_id"
    t.integer "usuario_id"
  end

  add_index "grupos", ["curso_id"], name: "index_grupos_on_curso_id", using: :btree
  add_index "grupos", ["usuario_id"], name: "index_grupos_on_usuario_id", using: :btree

  create_table "historials", force: true do |t|
    t.float   "nota",       limit: 24
    t.boolean "aprobado"
    t.integer "curso_id"
    t.integer "usuario_id"
  end

  add_index "historials", ["curso_id"], name: "index_historials_on_curso_id", using: :btree
  add_index "historials", ["usuario_id"], name: "index_historials_on_usuario_id", using: :btree

  create_table "item_resumen", force: true do |t|
    t.text     "titulo"
    t.text     "descripcion"
    t.integer  "resumen_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_resumen", ["resumen_id"], name: "index_item_resumen_on_resumen_id", using: :btree

  create_table "licencia", force: true do |t|
    t.string "nombre"
    t.text   "descripcion"
  end

  create_table "matriculas", force: true do |t|
    t.integer  "estatus"
    t.integer  "usuario_id"
    t.integer  "grupo_id"
    t.datetime "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matriculas", ["grupo_id"], name: "index_matriculas_on_grupo_id", using: :btree
  add_index "matriculas", ["usuario_id"], name: "index_matriculas_on_usuario_id", using: :btree

  create_table "menus", force: true do |t|
    t.integer  "rol_id"
    t.integer  "opcionmenu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["opcionmenu_id"], name: "index_menus_on_opcionmenu_id", using: :btree
  add_index "menus", ["rol_id"], name: "index_menus_on_rol_id", using: :btree

  create_table "modo_pagos", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modulos", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "orden"
    t.integer  "estatus"
    t.integer  "curso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "modulos", ["curso_id"], name: "index_modulos_on_curso_id", using: :btree

  create_table "notificacions", force: true do |t|
    t.text     "descripcion"
    t.string   "titulo"
    t.datetime "fecha"
    t.integer  "usuario_id"
    t.integer  "grupo_id"
  end

  add_index "notificacions", ["grupo_id"], name: "index_notificacions_on_grupo_id", using: :btree
  add_index "notificacions", ["usuario_id"], name: "index_notificacions_on_usuario_id", using: :btree

  create_table "objeto_aprendizajes", force: true do |t|
    t.string  "nombre"
    t.text    "descripcion"
    t.integer "orden"
  end

  create_table "opcion_menus", force: true do |t|
    t.string   "nombre"
    t.integer  "estatus"
    t.string   "url"
    t.integer  "padre"
    t.integer  "menu_id"
    t.string   "icono"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opcion_menus", ["menu_id"], name: "index_opcion_menus_on_menu_id", using: :btree

  create_table "organizacions", force: true do |t|
    t.string   "nombre"
    t.string   "subdominio"
    t.integer  "estatus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pago_matriculas", force: true do |t|
    t.integer  "modo_pago_id"
    t.integer  "matricula_id"
    t.float    "monto",            limit: 24
    t.datetime "fecha"
    t.string   "numero_operacion"
    t.integer  "estatus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pago_matriculas", ["matricula_id"], name: "index_pago_matriculas_on_matricula_id", using: :btree
  add_index "pago_matriculas", ["modo_pago_id"], name: "index_pago_matriculas_on_modo_pago_id", using: :btree

  create_table "pago_membresia", force: true do |t|
    t.float    "monto",            limit: 24
    t.datetime "fecha"
    t.string   "numero_operacion"
    t.integer  "modo_pago_id"
    t.integer  "usuario_id"
  end

  add_index "pago_membresia", ["modo_pago_id"], name: "index_pago_membresia_on_modo_pago_id", using: :btree
  add_index "pago_membresia", ["usuario_id"], name: "index_pago_membresia_on_usuario_id", using: :btree

  create_table "pais", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfils", force: true do |t|
    t.string  "nombre"
    t.binary  "foto"
    t.string  "formato_foto"
    t.string  "sexo"
    t.text    "intereses"
    t.string  "ocupacion"
    t.integer "perfil_id"
  end

  add_index "perfils", ["perfil_id"], name: "index_perfils_on_perfil_id", using: :btree

  create_table "pregunta", force: true do |t|
    t.text    "enunciado"
    t.boolean "tipo"
    t.integer "evaluacion_id"
  end

  create_table "pregunta_evaluacion_presentadas", force: true do |t|
    t.integer "evaluacion_id"
    t.integer "pregunta_id"
    t.integer "respuesta_id"
  end

  add_index "pregunta_evaluacion_presentadas", ["evaluacion_id"], name: "index_pregunta_evaluacion_presentadas_on_evaluacion_id", using: :btree
  add_index "pregunta_evaluacion_presentadas", ["pregunta_id"], name: "index_pregunta_evaluacion_presentadas_on_pregunta_id", using: :btree
  add_index "pregunta_evaluacion_presentadas", ["respuesta_id"], name: "index_pregunta_evaluacion_presentadas_on_respuesta_id", using: :btree

  create_table "prelacions", force: true do |t|
    t.integer "base_id"
    t.integer "materia_prelada_id"
  end

  add_index "prelacions", ["base_id"], name: "index_prelacions_on_base_id", using: :btree
  add_index "prelacions", ["materia_prelada_id"], name: "index_prelacions_on_materia_prelada_id", using: :btree

  create_table "ratings", force: true do |t|
    t.float   "suma_puntajes",  limit: 24
    t.integer "cantidad_votos"
    t.integer "curso_id"
  end

  add_index "ratings", ["curso_id"], name: "index_ratings_on_curso_id", using: :btree

  create_table "respuesta", force: true do |t|
    t.text    "valor"
    t.boolean "correcta"
    t.integer "evaluacion_id"
  end

  add_index "respuesta", ["evaluacion_id"], name: "index_respuesta_on_evaluacion_id", using: :btree

  create_table "respuesta_evaluacion_presentadas", force: true do |t|
    t.text    "respuesta"
    t.integer "respuesta_id"
  end

  add_index "respuesta_evaluacion_presentadas", ["respuesta_id"], name: "index_respuesta_evaluacion_presentadas_on_respuesta_id", using: :btree

  create_table "resumen", force: true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.integer  "modulo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resumen", ["modulo_id"], name: "index_resumen_on_modulo_id", using: :btree

  create_table "rols", force: true do |t|
    t.string  "nombre"
    t.integer "estatus"
  end

  create_table "sugerencia", force: true do |t|
    t.text    "contenido"
    t.boolean "estatus"
    t.integer "usuario_id"
  end

  add_index "sugerencia", ["usuario_id"], name: "index_sugerencia_on_usuario_id", using: :btree

  create_table "tipo_formatos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuario_notificacions", force: true do |t|
    t.boolean "revisado",        default: false
    t.integer "notificacion_id"
    t.integer "usuario_id"
  end

  add_index "usuario_notificacions", ["notificacion_id"], name: "index_usuario_notificacions_on_notificacion_id", using: :btree
  add_index "usuario_notificacions", ["usuario_id"], name: "index_usuario_notificacions_on_usuario_id", using: :btree

  create_table "usuario_rols", force: true do |t|
    t.integer "usuario_id"
    t.integer "rol_id"
  end

  add_index "usuario_rols", ["rol_id"], name: "index_usuario_rols_on_rol_id", using: :btree
  add_index "usuario_rols", ["usuario_id"], name: "index_usuario_rols_on_usuario_id", using: :btree

  create_table "usuarios", force: true do |t|
    t.string   "email",                  limit: 190, null: false
    t.string   "encrypted_password",                 null: false
    t.string   "nombre",                             null: false
    t.text     "pregunta_secreta"
    t.text     "respuesta_secreta"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree

end
