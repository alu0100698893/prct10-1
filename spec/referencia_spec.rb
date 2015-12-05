require "spec_helper"

describe LinkedRef::Referencia do
	before :each do
		@fecha = Date.new(2001, 2, 3)
		@ref1 = LinkedRef::Referencia.new(["Javier Palazon"], "Mi Titulo", @fecha)
		@ref2 = LinkedRef::Referencia.new(["Gabriel Garcia Marquez"], "Mi Titulo", @fecha)
		@ref3 = LinkedRef::Referencia.new(["Nombre Apellido"], "Titulo mayor que el del resto", @fecha)
	end
	describe "Existe la clase referencia" do
		it "Debe exisistir la clase referencia" do
			expect(LinkedRef::Referencia.new(["Nombre Apellido"], "Mi Titulo", @fecha)).not_to be_nil
		end
	end
	describe "Pruebas con los nombres" do
		it "Nombre Apellido" do
			expect(@ref1.autores).to eq("Palazon, J.")
			expect(@ref2.autores).to eq("Garcia, M. G.")
		end
		it "Lanzar excepcion si solo hay un elemento" do
			expect{LinkedRef::Referencia.new(["Nombre"], "Mi Titulo", @fecha)}.to raise_error(ArgumentError, "Se especifica unicamente el nombre o el apellido")
			expect{LinkedRef::Referencia.new(["Apellido"], "Mi Titulo", @fecha)}.to raise_error(ArgumentError, "Se especifica unicamente el nombre o el apellido")
		end
	end
	describe "Impresion de las fechas" do
		it "Fecha completa" do
			expect(@ref1.fecha_completa).to eq("3 de febrero de 2001")
		end
		it "Fecha anio solo" do
			expect(@ref1.fecha_anio).to eq("2001")
		end
	end
	it "Ordenar en base al autor" do
		expect(@ref2>@ref1).to be true #Garcia > Palazon? 7 > 17? false
		expect(@ref2<@ref1).to be false #Garcia < Palazon? 7 < 17? true
	end
end