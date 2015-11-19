require "spec_helper"

describe LinkedRef::Referencia do
	before :each do
		@fecha = Date.new(2001, 2, 3)
		@ref1 = LinkedRef::Referencia.new(["Nombre Apellido"], "Mi Titulo", @fecha)
		@ref2 = LinkedRef::Referencia.new(["Nombre Apellido Apellido"], "Mi Titulo", @fecha)
	end
	describe "Existe la clase referencia" do
		it "Debe exisistir la clase referencia" do
			expect(LinkedRef::Referencia.new(["Nombre Apellido"], "Mi Titulo", @fecha)).not_to be_nil
		end
	end
	describe "Pruebas con los nombres" do
		it "Nombre Apellido" do
			expect(@ref1.autores).to eq("Apellido, N.")
			expect(@ref2.autores).to eq("Apellido, N.")
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
		it "Fecha mes y anio" do
			expect(@ref1.fecha_mes).to eq("febrero 2001")
		end
		it "Fecha anio solo" do
			expect(@ref1.fecha_anio).to eq("2001")
		end
	end
end