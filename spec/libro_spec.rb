require "spec_helper"

describe LinkedRef::Libro do
	before :each do
		@libro = LinkedRef::Libro.new(["Gabriel Garcia Marquez"], "Cronica de una muerte anunciada", Date.new(1951,1,1), "La Oveja Negra", ["9871138016"], 3)
	end
	describe "Comprobar existencia de la clase" do
		it "Debe exisistir la clase libro" do
			expect(LinkedRef::Libro.new(["Nombre Apellido"], "Mi Titulo", @fecha, "El Maniana", ["11111-11111"], 5)).not_to be_nil
		end
	end
	describe "Debe almacenarse y mostrarse correctamente la referencia" do
		it "Libro Harry Potter" do
			expect(@libro.to_s).to eq("García, M. G. (1981). Cronicas de una Muerte Anunciada (4) (1). Colombia: La Oveja Negra.")
		end
	end
	#it "Debe poder ser comparable" do
	#	expect(@libro1>@libro3).to be true
	#	expect(@libro3<@libro1).to be true
	#end
end