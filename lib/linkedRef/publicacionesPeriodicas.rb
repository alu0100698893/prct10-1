require 'linkedRef/referencia'

module LinkedRef
	class PublicacionesPeriodicas < Referencia
		def initialize(autores, titulo, fecha, formato, pais=nil)
			super(autores, titulo, fecha, pais)
			raise ArgumentError, "El formato no es string" unless formato.is_a?(String)
			@formato = formato.capitalize
		end
	end
end