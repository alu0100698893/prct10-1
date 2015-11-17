require "spec_helper"

describe LinkedRef::Referencia do
	before :each do
		@fecha = Date.new(2001, 2, 3)
		@ref1 = LinkedRef::Referencia.new(["Nombre Apellido"], "Mi Título", @fecha)
		@ref2 = LinkedRef::Referencia.new(["Nombre Apellido Apellido"], "Mi Título", @fecha)
	end
	describe "Existe la clase referencia" do
		it "Debe exisistir la clase referencia" do
			expect(LinkedRef::Referencia.new(["Nombre Apellido"], "Mi Título", @fecha)).not_to be_nil
		end
	end
	describe "Pruebas con los nombres" do
		it "Nombre Apellido" do
			expect(@ref1.autores).to eq("Apellido, N.")
			expect(@ref2.autores).to eq("Apellido, N.")
		end
		it "Lanzar excepción si sólo hay un elemento" do
			expect{LinkedRef::Referencia.new(["Nombre"], "Mi Título", @fecha)}.to raise_error(ArgumentError, "Se especifica únicamente el nombre o el apellido")
			expect{LinkedRef::Referencia.new(["Apellido"], "Mi Título", @fecha)}.to raise_error(ArgumentError, "Se especifica únicamente el nombre o el apellido")
		end
	end
end