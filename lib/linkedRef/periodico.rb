require 'linkedRef/publicacionesPeriodicas'

module LinkedRef
	class Periodico < PublicacionesPeriodicas
		def initialize(autores, titulo, fecha, periodico, paginas)
			formato="Papel"
			super(autores, titulo, fecha, formato)
			raise ArgumentError, "El periodico no es un string" unless periodico.is_a?(String)
			raise ArgumentError, "Las paginas no es un entero" unless  paginas.is_a?(Integer)
			@periodico = periodico
			@paginas = paginas
		end
		def to_s()
			string = ""
			string << @autores << " (" << fecha_completa(@fecha) << "). " << @titulo << ". " << @periodico << ", pp. " << @paginas.to_s << "."
		end
	end
end