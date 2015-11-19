require "spec_helper"

describe LinkedRef::Libro do
	before :each do
		@fecha = Date.new(2000,1,1)
		@libro1 = LinkedRef::Libro.new(["Joanne Rowling"], "Harry Potter y la Piedra Filosofal", Date.new(1997,6,26), "Salamandra", ["2070541274", "847-8885617"], 6)
		@libro2 = LinkedRef::Libro.new(["Gabriel Garcia Marquez"], "Cronica de una muerte anunciada", Date.new(1951,1,1), "La Oveja Negra", ["9871138016"], 3)
		@libro3 = LinkedRef::Libro.new(["Felix Garcia Sarmiento"], "Azul...", Date.new(1888,7,30), "Alianza Editorial", ["978-8420668406"])
	end
	describe "Comprobar existencia de la clase" do
		it "Debe exisistir la clase libro" do
			expect(LinkedRef::Libro.new(["Nombre Apellido"], "Mi Titulo", @fecha, "El Maniana", ["11111-11111"], 5)).not_to be_nil
		end
	end
	describe "Debe almacenarse correctamente la referencia" do
		it "Libro Harry Potter" do
			expect(@libro1.to_s).to eq("Rowling, J.\nHarry Potter y la Piedra Filosofal.\nEd: Salamandra (6)\nISBN-10: 2070541274\nISBN-13: 847-8885617")
		end
		it "Libro Cien anios de soledad" do
			expect(@libro2.to_s).to eq("Garcia, G.\nCronica de una muerte anunciada.\nEd: La Oveja Negra (3)\nISBN-10: 9871138016")
		end
		it "Libro Cronica de una muerte anunciada" do
			expect(@libro3.to_s).to eq("Garcia, F.\nAzul....\nEd: Alianza Editorial\nISBN-13: 978-8420668406")
		end
	end
	it "Debe poder ser comparable" do
		expect(@libro1>@libro3).to be true
		expect(@libro3<@libro1).to be true
	end
end