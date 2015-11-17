require 'linkedRef/referencia'

module LinkedRef
	class ArticuloPeriodico < Referencia
		def initialize(autores, titulo, fecha, periodico)
			super(autores, titulo, fecha)
			@periodico = periodico
		end
	end
end