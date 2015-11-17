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
		@artPer1 = LinkedRef::ArticuloPeriodico.new(["Jorge Berngueras"], "Youtube Music, la app de vídeos musicales de Google, ya se puede descargar", Date.new(2015, 11, 12), "El Periódico")
		@artPer2 = LinkedRef::ArticuloPeriodico.new(["Juan Palazon", "Laura Pajuelo"], "El primer móvil con Android One", Date.new(2015, 11, 16), "El País")
		@artPer3 = LinkedRef::ArticuloPeriodico.new(["Carlos Fresneda"], "El Gobierno británico lleva la guerra contra el terrorismo al ciberespacio", Date.new(2015, 11, 12), "El Mundo")
	end
	it 'Debe existir a clase' do
		expect(LinkedRef::ArticuloPeriodico.new(["Nombre Apellido"], "Mi Título", @fecha, "Mi periodico")).not_to be_nil
	end
	escribe "Debe almacenarse correctamente la referencia" do
		it "Referencia Berngueras" do
			expect(@artPer1.to_s).to eq("Berngueras, J. (12 de noviembre de 2015).\nYoutube Music, la app de vídeos musicales de Google, ya se puede descargar.\nEl Periódico.")
		end
		it "Referencia Palazon y Pajuelo" do
			expect(@artPer2.to_s).to eq("Palazon, J., Pajuelo, L. (16 de noviembre de 2015).\nEl primer móvil con Android One.\nEl País.")	
		end
		it "Referencia Fresneda" do
			expect(@artPer3.to_s).to eq("Fresneda, C. (17 de noviembre de 2015).\nEl Gobierno británico lleva la guerra contra el terrorismo al ciberespacio.\nEl Mundo")
		end
	end
end