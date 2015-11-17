require 'linkedRef/referencia'

module LinkedRef
	class DocumentoElectronico < Referencia
		def initialize(autores, titulo, fecha)
			super(autores, titulo, fecha)
		end
	end
end