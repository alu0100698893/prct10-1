require 'linkedRef/articulo'

module LinkedRef
	class Revista < Articulo
		def initialize(autores, titulo, fecha, revista, numero, volumen=nil)
			super(autores, titulo, fecha)
			@revista = revista
			@volumen = volumen
			@numero = numero
		end
		def to_s
			string = ""
			string += autores
			string +="\n"
			string += titulo
			string += ".\n"
			string += @revista
			string += ", "
			if(!@volumen.nil?)
				string += @volumen.to_s
				string += " "
			end
			string += "(" + @numero.to_s + ")"
			string += ", " + fecha_mes
			string += "."
		end
	end
end