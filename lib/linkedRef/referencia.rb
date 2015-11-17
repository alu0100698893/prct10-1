# Formato de nombres:

# Jose Sánchez
# Sánchez, J.

# Jorge Acosta
# Acosta, J.

# Sergio Gómez Toledo
# Gómez, S.

# Rafael Herrero Álvarez
# Herrero, R.

module LinkedRef
	class Referencia
		def initialize(autores, titulo, fecha)
			raise ArgumentError, "El autor no es un array" unless autores.is_a?(Array)
			autores.each do |a|
				raise ArgumentError, "Uno de los autores no es un string" unless a.is_a?(String)
			end
			raise ArgumentError, "El titulo no es un string" unless titulo.is_a?(String)
			raise ArgumentError, "La fecha no es de tipo Date" unless fecha.is_a?(Date)
			@autores = autores
			@titulo = titulo
			@fecha = fecha
		end
	end
end