class CursoCategoria < ActiveRecord::Base
  belongs_to :categoria, class_name: "Categoria", foreign_key: "categoria_id"
  belongs_to :curso
end
