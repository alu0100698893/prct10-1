require "spec_helper"

describe LinkedRef::Referencia do
	before :all do
		@fecha = Date.new(2001, 2, 3)
		@ref1 = LinkedRef::Referencia.new(["Javier Palazon"], "Mi Titulo", @fecha)
		@ref2 = LinkedRef::Referencia.new(["Gabriel Garcia Marquez"], "Mi Titulo", @fecha)
		@ref3 = LinkedRef::Referencia.new(["Gabriel Garcia Marquez", "Javier Palazon"], "Mi Titulo", @fecha)
		
		@fecha1 = Date.new(1997, 2, 3)
		@fecha2 = Date.new(2001, 2, 3)
		@ref4 = LinkedRef::Referencia.new(["Javier Palazon"], "Mi Titulo", @fecha1)
		@ref5 = LinkedRef::Referencia.new(["Javier Palazon"], "Mi Titulo", @fecha2)
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
			expect(@ref3.autores).to eq("Garcia, M. G. & Palazon, J.")
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
	it "Ordenar en base al autor simplemente" do
		expect(@ref2<@ref1).to be false #Garcia < Palazon? 7 < 17? true
		expect(@ref2>@ref1).to be true #Garcia > Palazon? 7 > 17? false
	end
	it "Si los autores coiniciden, ordenar en base a la fecha (mas antiguo primero" do
		expect(@ref4<@ref5).to be true #1997 < 2001? true
		expect(@ref4>@ref5).to be false #1997 > 2001? false
	end
end