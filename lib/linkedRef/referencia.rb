# Formato de nombres:

# Jose Sánchez
# Sánchez, J.

# Jorge Acosta
# Acosta, J.

# Sergio Gómez Toledo
# Gómez, S.

# Rafael Herrero Álvarez
# Herrero, R.

require "date"

module LinkedRef
	class Referencia
		attr_reader :titulo
		include Comparable
		def initialize(autores, titulo, fecha)
			raise ArgumentError, "El autor no es un array" unless autores.is_a?(Array)
			autores.each do |a|
				raise ArgumentError, "Uno de los autores no es un string" unless a.is_a?(String)
				raise ArgumentError, "Se especifica unicamente el nombre o el apellido" unless a.split(/\W+/).length > 1
			end
			raise ArgumentError, "El titulo no es un string" unless titulo.is_a?(String)
			raise ArgumentError, "La fecha no es de tipo Date" unless fecha.is_a?(Date)
			@autores = autores
			@titulo = titulo
			@fecha = fecha
		end
		def autores
			final = ""
			@autores.each do |a|
				separado = a.split(/\W+/)
				final+=separado[1]
				final+=", "
				final+=separado[0][0]
				final+="."
				final+=", " unless a == @autores.last
			end
			return final
		end
		def get_mes(numero)
			return case numero
			when 1
				"enero"
			when 2
				"febrero"
			when 3
				"marzo"
			when 4
				"abril"
			when 5
				"mayo"
			when 6
				"junio"
			when 7
				"julio"
			when 8
				"agosto"
			when 9
				"septiembre"
			when 10
				"octubre"
			when 11
				"noviembre"
			when 12
				"diciembre"
			else
				"???"
			end	
		end
		def fecha_completa()
			string =  @fecha.day.to_s
			string += " de "
			string += get_mes(@fecha.mon)
			string += " de "
			string += @fecha.year.to_s
		end
		def fecha_mes()
			string = ""
			string += get_mes(@fecha.mon)
			string += " "
			string += @fecha.year.to_s
		end
		def fecha_anio()
			@fecha.year.to_s
		end
		def <=>(other)
			return @titulo.size <=> other.titulo.size
		end
	end
end