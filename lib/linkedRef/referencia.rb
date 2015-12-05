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
		attr_reader :titulo, :autores, :fecha
		include Comparable
		def initialize(autores, titulo, fecha, pais=nil)
			raise ArgumentError, "El autor no es un array" unless autores.is_a?(Array)
			str=""
			autores.each do |a|
				raise ArgumentError, "Uno de los autores no es un string" unless a.is_a?(String)
				raise ArgumentError, "Se especifica unicamente el nombre o el apellido" unless a.split(' ').length > 1
				separado = a.split(/\W+/)
				str+=separado[1]
				str+=", "
				unless separado[2].nil?
					str+=separado[2][0]
					str+=". "
				end
				str+=separado[0][0]
				str+="."
				str+=" & " unless a == autores.last
			end
			@autores = str
			raise ArgumentError, "El titulo no es un string" unless titulo.is_a?(String)
			raise ArgumentError, "La fecha no es de tipo Date" unless fecha.is_a?(Date)
			raise ArgumentError, "El pais no es string o nulo" unless pais.nil? or pais.is_a?(String)

			titarr = titulo.split(' ')
			titarr.each do |palabra|
				if palabra.length > 3
					palabra.capitalize!
				else
					palabra.downcase!
				end
				if palabra == titarr[0]
					palabra.capitalize!
				end
			end

			@titulo = titarr.join(' ')

			@fecha = fecha
			@pais = pais
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
				raise RuntimeError, "Numero erroneo de mes"
			end	
		end
		def fecha_completa(fecha=@fecha)
			string =  fecha.day.to_s
			string += " de "
			string += get_mes(fecha.mon)
			string += " de "
			string += fecha.year.to_s
		end
		def fecha_anio()
			@fecha.year.to_s
		end
		def <=>(other)
			if(@autores == other.autores)
				if(@fecha == other.fecha)
					if(@titulo == other.titulo)
						return 0 #Son iguales
					else
						arr = [@titulo, other.titulo]
						arr.sort_by!{|t| t.downcase}
						if(arr.first == @titulo)
							return 1
						end
						return -1
					end
				elsif fecha > other.fecha
					return -1
				else
					return 1
				end
			else
				arr = [@autores, other.autores]
				arr.sort_by!{|t| t.downcase}
				if(arr.first == @autores)
					return -1
				end
				return 1
			end
		end
	end
end