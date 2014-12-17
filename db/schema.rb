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

ActiveRecord::Schema.define(version: 20141216154316) do

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

  create_table "base_datos", id: false, force: true do |t|
    t.string "nombre", limit: 200, null: false
  end

  create_table "contenidos", force: true do |t|
    t.integer "orden"
    t.integer "modulo_id"
    t.integer "objeto_aprendizaje_id"
  end

  add_index "contenidos", ["modulo_id"], name: "index_contenidos_on_modulo_id", using: :btree
  add_index "contenidos", ["objeto_aprendizaje_id"], name: "index_contenidos_on_objeto_aprendizaje_id", using: :btree

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

  create_table "licencia", force: true do |t|
    t.string "nombre"
    t.text   "descripcion"
  end

  create_table "menus", force: true do |t|
    t.integer  "rol_id"
    t.integer  "opcionmenu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["opcionmenu_id"], name: "index_menus_on_opcionmenu_id", using: :btree
  add_index "menus", ["rol_id"], name: "index_menus_on_rol_id", using: :btree

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

  create_table "prelacions", force: true do |t|
    t.integer "base_id"
    t.integer "materia_prelada_id"
  end

  add_index "prelacions", ["base_id"], name: "index_prelacions_on_base_id", using: :btree
  add_index "prelacions", ["materia_prelada_id"], name: "index_prelacions_on_materia_prelada_id", using: :btree

  create_table "rols", force: true do |t|
    t.string  "nombre"
    t.integer "estatus"
  end

  create_table "tipo_formatos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
