class Prelacion < ActiveRecord::Base
  belongs_to :base
  belongs_to :cursos
end
