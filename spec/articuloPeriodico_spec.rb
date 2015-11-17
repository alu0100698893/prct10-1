require "spec_helper"


# Formato de revista:
# Autor[,...]. (fecha).
# Título del artículo.
# Nombre del periódico.

# Berngueras, J. (12 de noviembre de 2015).
# Youtube Music, la app de vídeos musicales de Google, ya se puede descargar.
# El Periódico.

# Palazón, J., Pajuelo, L. (16 de noviembre de 2015).
# El primer móvil con Android One.
# El País.

# Fresneda, C. (17 de noviembre de 2015).
# El Gobierno británico lleva la guerra contra el terrorismo al ciberespacio.
# El Mundo.

describe LinkedRef::ArticuloPeriodico do
	before :each do
		@fecha = Date.new(2001, 2, 3)
	end
	it 'Debe existir a clase' do
		expect(LinkedRef::ArticuloPeriodico.new(["Nombre Apellido"], "Mi Título", @fecha, "Mi periodico")).not_to be_nil
	end
end