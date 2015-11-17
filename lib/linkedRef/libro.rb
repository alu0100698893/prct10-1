require 'linkedRef/referencia'

module LinkedRef
	class Libro < Referencia
		def initialize(autores, titulo, fecha, editorial, isbn, edicion = nil)
			super(autores, titulo, fecha)
			raise ArgumentError, "La editorial no es un string" unless editorial.is_a?(String)
			raise ArgumentError, "El isbn no es un array" unless isbn.is_a?(Array)
			raise ArgumentError, "La edicion no es numeric o nil" unless edicion.nil? || edicion.is_a?(Numeric)
			@editorial = editorial
			@edicion = edicion
			@isbn = isbn
		end
		def to_s
			string = ""
			string += autores
			string += "\n" + titulo
			string += ".\nEd: " + @editorial
			string += " (" + @edicion.to_s + ")" unless @edicion.nil?
			string += "\n"
			@isbn.each do |i|
				if(i.length < 11)
					string << "ISBN-10: " << i
				else
					string << "ISBN-13: " << i
				end
				string << "\n" unless i == @isbn.last
			end
			return string
		end
	end
end