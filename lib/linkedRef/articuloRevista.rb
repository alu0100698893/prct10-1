require 'linkedRef/referencia'

module LinkedRef
	class ArticuloRevista < Referencia
		def initialize(autores, titulo, fecha, revista, numero, volumen=nil)
			super(autores, titulo, fecha)
			@revista = revista
			@volumen = volumen
			@numero = numero
		end
	end
end