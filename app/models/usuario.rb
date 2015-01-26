class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :omniauthable#, :confirmable #, 
          #, :trackable, :validatable
  #validates :nombre, presence: true
  #validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  has_many :comentarios, class_name: "CriticaCurso",
             foreign_key: "comentario_id"
  has_many :autenticacions, dependent: :delete_all
  has_many :usuario_rols, class_name: "UsuarioRol", foreign_key: "usuario_id"
  has_many :rols, :through => :usuario_rols
  has_many :usuario_red_social, class_name: "UsuarioRedSocial", foreign_key: "usuario_id"
  has_many :redes_sociales, :through => :usuario_red_social
  has_many :sugerencia
  has_many :entrega_asignacions
  has_many :matriculas
  has_many :historials
  has_many :mensajes
  has_many :pago_membresia
  has_many :evaluacion_presentadas
  has_many :evaluacion_grupos, :through => :evaluacion_presentadas
  has_one :pais
  has_one :perfil
  has_one :organizacion, :inverse_of=>:usuario

  accepts_nested_attributes_for :organizacion
  accepts_nested_attributes_for :perfil

  attr_accessor :rol_actual
  @rol_actual

  after_initialize :set_rol_actual

  private
    def set_rol_actual
      self.rol_actual = self.rols[0]
    end

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Autenticacion.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    usuario = signed_in_resource ? signed_in_resource : identity.usuario

    # Create the user if needed
    if usuario.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      usuario = Usuario.where(:email => email).first if email

      # Create the user if it's a new registration
      if usuario.nil?
        usuario = Usuario.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        usuario.skip_confirmation!
        usuario.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.usuario != usuario
      identity.usuario = usuario
      identity.save!
    end
    usuario
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

end
