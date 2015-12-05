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
		attr_reader :titulo, :autores_arr
		include Comparable
		def initialize(autores, titulo, fecha, pais=nil)
			raise ArgumentError, "El autor no es un array" unless autores.is_a?(Array)
			autores_ape = []
			autores.each do |a|
				raise ArgumentError, "Uno de los autores no es un string" unless a.is_a?(String)
				raise ArgumentError, "Se especifica unicamente el nombre o el apellido" unless a.split(/\W+/).length > 1
				separado = a.split(/\W+/)
				final = []
				separado.each do |str|
					final << str
				end
				autores_ape << final
			end
			raise ArgumentError, "El titulo no es un string" unless titulo.is_a?(String)
			raise ArgumentError, "La fecha no es de tipo Date" unless fecha.is_a?(Date)
			@autores = autores_ape
			@autores_arr = autores_ape
			@titulo = titulo
			@fecha = fecha
			@pais = pais
		end
		def autores
			final = ""
			@autores.each do |a|
				final+=a[1]
				final+=", "
				unless a[2].nil?
					final+=a[2][0]
					final+=". "
				end
				final+=a[0][0]
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
				raise RuntimeError, "Numero erroneo de mes"
			end	
		end
		def fecha_completa()
			string =  @fecha.day.to_s
			string += " de "
			string += get_mes(@fecha.mon)
			string += " de "
			string += @fecha.year.to_s
		end
		def fecha_anio()
			@fecha.year.to_s
		end
		def <=>(other)
			if(@autores == other.autores)
				puts "Los autores son iguales, ordenar en base a la publicacion"
				if(@fecha == other.fecha)
					puts "Ordenar en base a el título"
					if(@titulo == other.titulo)
						return 0 #Son iguales
					else
						if(@titulo == other.titulo)
							return 0
						end
						arr = [@titulo, other.titulo]
						arr.sort_by!{|t| t.downcase}
						if(arr.first == @titulo)
							return -1
						end
						return 1
					end
				elsif fecha > other.fecha
					return 1
				else
					return -1
				end
			else
				puts "Los autores son distintos, revisar el tamaño"
				if @autores.size < other.autores_arr.size
					puts "Other tiene mas autores"
					if(other.autores_arr-@autores).empty?
						return -1
					end
				elsif @autores.size > other.autores_arr.size
					puts "Self tiene mas autores"
					if(other.autores_arr-@autores).empty?
						return 1
					end
				end
				#Si tienen el mismo tamaño, ordenar segun el apellido del primer autor
				puts "Tienen el mismo tamaño, asi que hay que ver cual va primero"
				arr = [@autores[0][1], other.autores_arr[0][1]]
				arr.sort_by!{|t| t.downcase}
				if(arr.first == @autores)
					return -1
				end
				return 1
			end
		end
	end
end