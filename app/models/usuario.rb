class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable #, :trackable, :validatable
  #validates :nombre, presence: true
  has_many :comentarios, class_name: "CriticaCurso",
             foreign_key: "comentario_id"
  has_many :usuario_rols, class_name: "UsuarioRol", foreign_key: "usuario_id"
  has_many :rols, :through => :usuario_rols
  has_many :sugerencia
  has_many :entrega_asignacions
  has_many :matriculas
  has_many :historials
  has_many :usuario_notificacions
  has_many :pago_membresia
  has_many :evaluacion_presentadas
  has_many :evaluacion_grupos, :through => :evaluacion_presentadas
  has_one :pais
  has_one :perfil
  has_one :organizacion

  attr_accessor :rol_actual
  @rol_actual

  after_initialize :set_rol_actual

  private
    def set_rol_actual
      self.rol_actual = self.rols[0]
    end


end
