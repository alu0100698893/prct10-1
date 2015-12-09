require 'linkedRef/publicacionesPeriodicas'
require 'date'

module LinkedRef
	class DocumentoElectronico < PublicacionesPeriodicas
		#autores, titulo, fecha, formato, pais=nil)
		def initialize(autores, titulo, fecha, formato, pais, edicion, url, editor, fecha_acc)
			super(autores, titulo, fecha, formato, pais)
			raise ArgumentError, "La edicion no es un entero" unless edicion.is_a?(Integer)
			raise ArgumentError, "La URL no es un string" unless url.is_a?(String)
			raise ArgumentError, "El editor no es un string" unless url.is_a?(String)
			raise ArgumentError, "La fecha no es de tipo Date" unless fecha_acc.is_a?(Date)
			@url = url
			@edicion = edicion
			@editor = editor
			@fecha_acc = fecha_acc
		end
		def to_s
			string = ""
			string << @autores << " (" << fecha_completa(fecha) << "). " << @titulo << " (" << @edicion.to_s << "), " << @formato << ". " << @pais << ": " << @editor << ". Disponible en: " << @url << " (" << @fecha_acc.day.to_s << "-" << @fecha_acc.mon.to_s << "-" << @fecha_acc.year.to_s << ")."
		end
	end
end