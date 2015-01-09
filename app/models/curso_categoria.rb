class CursoCategoria < ActiveRecord::Base
  belongs_to :categoria
  belongs_to :curso
end
