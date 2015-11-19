require "spec_helper"

# Formato de revista:
# Autor[,...]. (fecha).
# Titulo del articulo.
# Nombre del periodico.

# Berngueras, J. (12 de noviembre de 2015).
# Youtube Music, la app de videos musicales de Google, ya se puede descargar.
# El Periodico.

# Palazon, J., Pajuelo, L. (16 de noviembre de 2015).
# El primer movil con Android One.
# El Pais.

# Fresneda, C. (17 de noviembre de 2015).
# El Gobierno britanico lleva la guerra contra el terrorismo al ciberespacio.
# El Mundo.

describe LinkedRef::Periodico do
	before :each do
		@fecha = Date.new(2001, 2, 3)
		@artPer1 = LinkedRef::Periodico.new(["Jorge Berngueras"], "Youtube Music, la app de videos musicales de Google, ya se puede descargar", Date.new(2015, 11, 12), "El Periodico")
		@artPer2 = LinkedRef::Periodico.new(["Juan Palazon", "Laura Pajuelo"], "El primer movil con Android One", Date.new(2015, 11, 16), "El Pais")
		@artPer3 = LinkedRef::Periodico.new(["Carlos Fresneda"], "El Gobierno britanico lleva la guerra contra el terrorismo al ciberespacio", Date.new(2015, 11, 17), "El Mundo")
	end
	it 'Debe existir a clase' do
		expect(LinkedRef::Periodico.new(["Nombre Apellido"], "Mi Titulo", @fecha, "Mi periodico")).not_to be_nil
	end
	describe "Debe almacenarse correctamente la referencia" do
		it "Referencia Berngueras" do
			expect(@artPer1.to_s).to eq("Berngueras, J. (12 de noviembre de 2015).\nYoutube Music, la app de videos musicales de Google, ya se puede descargar.\nEl Periodico.")
		end
		it "Referencia Palazon y Pajuelo" do
			expect(@artPer2.to_s).to eq("Palazon, J., Pajuelo, L. (16 de noviembre de 2015).\nEl primer movil con Android One.\nEl Pais.")	
		end
		it "Referencia Fresneda" do
			expect(@artPer3.to_s).to eq("Fresneda, C. (17 de noviembre de 2015).\nEl Gobierno britanico lleva la guerra contra el terrorismo al ciberespacio.\nEl Mundo.")
		end
	end
	it "Debe poder ser comparable" do
		expect(@artPer1>@artPer2).to be true
		expect(@artPer2<@artPer1).to be true
	end
end