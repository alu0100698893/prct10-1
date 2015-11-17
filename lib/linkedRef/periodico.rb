require 'linkedRef/articulo'

module LinkedRef
	class Periodico < Articulo
		def initialize(autores, titulo, fecha, periodico)
			super(autores, titulo, fecha)
			@periodico = periodico
		end
		def to_s()
			string = ""
			string += autores
			string += " (" + fecha_completa + ").\n"
			string += titulo
			string += ".\n"
			string += @periodico + "."
			return string
		end
	end
end