class Mensaje < ActiveRecord::Base
  belongs_to :grupo
  belongs_to :usuario
end
