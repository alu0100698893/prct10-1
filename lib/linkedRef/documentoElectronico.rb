require 'linkedRef/referencia'

module LinkedRef
	class DocumentoElectronico < Referencia
		def initialize(autores, titulo, fecha, url)
			super(autores, titulo, fecha)
			@url = url
		end
	end
end