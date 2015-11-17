require "spec_helper"

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

describe LinkedRef::ArticuloRevista do
	before :each do
		@fecha = Date.new(2001, 2, 3)
	end
	it 'Debe existir a clase' do
		expect(LinkedRef::ArticuloRevista.new(["Jose Berngueras"], "Mi Título", @fecha, "dummy", "ddummy")).not_to be_nil
	end
end