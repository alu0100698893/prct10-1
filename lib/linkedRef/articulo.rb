require 'linkedRef/publicacionesPeriodicas'

module LinkedRef
	class Articulo < PublicacionesPeriodicas
		def initialize(autores, titulo, fecha)
			super(autores, titulo, fecha)
		end
	end
end