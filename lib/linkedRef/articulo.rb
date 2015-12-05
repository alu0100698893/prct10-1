require 'linkedRef/libro'

module LinkedRef
	class Articulo < Libro
		def initialize(autores, titulo, anio, editorial, edicion, volumen, pais, capitulo, editores, paginas)
			super(autores, titulo, anio, editorial, edicion, volumen, pais)
			raise ArgumentError, "La capitulo no es un string" unless capitulo.is_a?(String)
			raise ArgumentError, "Los editores no estan en un array" unless editores.is_a?(Array)
			str=""
			editores.each do |e|
				raise ArgumentError, "Uno de los autores no es un string" unless e.is_a?(String)
				raise ArgumentError, "Se especifica unicamente el nombre o el apellido" unless e.split(' ').length > 1
				separado = e.split(' ')
				str+=separado[1]
				str+=", "
				unless separado[2].nil?
					str+=separado[2][0]
					str+=". "
				end
				str+=separado[0][0]
				str+="."
				str+=" & " unless e == editores.last
			end
			raise ArgumentError, "Las paginas no son un numero" unless paginas.is_a?(Integer)

			@editores = str
			@capitulo = capitulo
			@paginas = paginas
		end
		def to_s()
			string = ""
			string << @autores << " (" << fecha_anio() << "). " << @capitulo << ". En " << @editores << " (Eds.), " << @titulo << " (" << @paginas.to_s << ") (" << @edicion.to_s << ") (" << @volumen.to_s << "). " << @pais << ": " << @editorial << "."
		end
	end
end