require 'linkedRef/referencia'

# Formato de revista:
# Autor[, ...]
# Título del artículo.
# Título de la revista, [Volumen] (número), fecha

# Castagnio, J.
# Técnicas, materiales y aplicaciones en nanotecnología.
# Acta Bioquímica Clínica Latinoamericana, 41 (2), abril 2007.

# Perisco, P., Perisco, C.
# Acreditación en Chile la experiencia de un lustro.
# Creatividad, educación y desarrollo, (25), agosto 1997.

# Valdés, H., Áviles, P., Mandakovic, B.
# ¿La tierra se toma la revancha?: calentamiento global.
# Conozca más, 19 (10), octubre 2008.

module LinkedRef
	class ArticuloRevista < Referencia
		def initialize(autores, titulo, fecha, revista, numero, volumen=nil)
			super(autores, titulo, fecha)
			@revista = revista
			@volumen = volumen
			@numero = numero
		end
	end
end