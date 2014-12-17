class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable #, :trackable, :validatable
  #validates :nombre, presence: true
  has_many :usuario_rols
  has_many :entrega_asignacions
  has_many :matriculas
  has_many :rols, :through => :usuario_rols
  has_one :pais
  has_one :perfil
end
