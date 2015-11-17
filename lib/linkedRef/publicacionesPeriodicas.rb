require 'linkedRef/referencia'

module LinkedRef
	class PublicacionesPeriodicas < Referencia
		def initialize(autores, titulo, fecha)
			super(autores, titulo, fecha)
		end
	end
end