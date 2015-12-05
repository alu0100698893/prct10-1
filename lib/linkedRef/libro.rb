require 'linkedRef/referencia'

module LinkedRef
	class Libro < Referencia
		def initialize(autores, titulo, anio, editorial, edicion, volumen, pais)
			raise ArgumentError, "El anio no es integer" unless anio.is_a?(Integer)
			fecha = Date.new(anio, 1, 1)
			super(autores, titulo, fecha, pais)
			raise ArgumentError, "La editorial no es un string" unless editorial.is_a?(String)
			raise ArgumentError, "La edicion no es un numero" unless edicion.is_a?(Integer)
			raise ArgumentError, "El volumen no es un mnumero" unless volumen.is_a?(Integer)
			@editorial = editorial
			@edicion = edicion
			@volumen = volumen
		end
		def to_s
			string = ""
			string  << @autores << " (" << fecha_anio() << "). " << @titulo << " (" << @edicion.to_s << ") (" << @volumen.to_s << "). " << @pais << ": " << @editorial << "."
		end
	end
end