class Organizacion < ActiveRecord::Base

	after_create do
		Apartment::Tenant.create(self.subdominio)
		BaseDato.create(nombre: self.dominio)
	end
	RESTRICTED_SUBDOMAINS = %w{www}

	validates :subdominio, presence: true,
						uniqueness: { case_sensitive: false },
						#format: { with: /\A[w\-]+\Z/i, message: 'Contiene caracteres no validos' },
						exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'Restringido'}						
	before_validation :convertir_subdominio

	private
		def convertir_subdominio
			self.subdominio = subdominio.try(:downcase)
		end


end
