require "spec_helper"

describe LinkedRef::Periodico do
	before :all do
		@fecha = Date.new(2015, 11, 15)
		@artPer = LinkedRef::Periodico.new(["Javier Palazon", "Laura Pajuelo"], "El primer movil con Android One", @fecha, "El Pais", 68)
	end
	it 'Debe existir la clase' do
		expect(LinkedRef::Periodico.new(["Nombre Apellido"], "Mi Titulo", @fecha, "Mi periodico", 23)).not_to be_nil
	end
	describe "Debe almacenarse correctamente la referencia" do
		it "Referencia de ejmplo del README" do
			expect(@artPer.to_s).to eq("Palazon, J. & Pajuelo, L. (15 de noviembre de 2015). El Primer Movil con Android one. El Pais, pp. 68.")
		end
	end
end