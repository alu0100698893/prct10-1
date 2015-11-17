require 'linkedRef/referencia'

module LinkedRef
	class DocumentoElectronico < PublicacionesPeriodicas
		def initialize(autores, titulo, fecha, url)
			super(autores, titulo, fecha)
			@url = url
		end
		def to_s()
			string = ""
			string += autores
			string += " (" + fecha_anio + ").\n"
			string += titulo
			string += ".\nDisponible en " + @url
			return string
		end
	end
end