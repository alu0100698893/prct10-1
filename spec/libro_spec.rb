require "spec_helper"

describe LinkedRef::Libro do
	before :all do
		@libro = LinkedRef::Libro.new(["Gabriel Garcia Marquez"], "Cronicas de una muerte anunciada", 1981, "La Oveja Negra", 4, 1, "Colombia")
	end
	describe "Comprobar existencia de la clase" do
		it "Debe exisistir la clase libro" do
			expect(LinkedRef::Libro.new(["Nombre Apellido"], "Mi Titulo", 2000, "Test", 1, 1, "Espana")).not_to be_nil
		end
	end
	describe "Debe almacenarse y mostrarse correctamente la referencia" do
		it "Libro de ejemplo del README" do
			expect(@libro.to_s).to eq("Garcia, M. G. (1981). Cronicas de una Muerte Anunciada (4) (1). Colombia: La Oveja Negra.")
		end
	end
end