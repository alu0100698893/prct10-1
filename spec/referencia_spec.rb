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

		@ref6 = LinkedRef::Referencia.new(["Javier Palazon"], "AAA primero", @fecha)
		@ref7 = LinkedRef::Referencia.new(["Javier Palazon"], "ZZZ segundo", @fecha)

		@ref8 = LinkedRef::Referencia.new(["Nombre Apellido"], "Un titulo bien formateado sin mayusculas", @fecha)
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
	describe "El método comparable funciona correctamente" do
		it "Ordenar en base al autor simplemente" do
			expect(@ref2<@ref1).to be false #Garcia < Palazon? 7 < 17? true
			expect(@ref1<@ref2).to be true #Garcia > Palazon? 17 < 7? false
		end
		it "Si los autores coiniciden, ordenar en base a la fecha (mas antiguo primero" do
			expect(@ref4<@ref5).to be true #1997 < 2001? true
			expect(@ref5<@ref4).to be false #2001 < 1997? false
		end
		it "Si los autores y las fechas coinciden, ordenar en base al título" do
			expect(@ref6<@ref7).to be true #A < Z? true
			expect(@ref7<@ref6).to be false #A < Z? true
		end
		it "Si son iguales, devolvemos un cero en el comparable" do
			expect(@ref1<@ref1).to be false #A < A? false
			expect(@ref1>@ref1).to be false #A > A? false
			expect(@ref1==@ref1).to be true #A == A? true
		end
	end
	describe "Pruebas con cada uno de los meses" do
		it "Prueba enero" do
			expect(@ref1.get_mes(1)).to eq("enero")
		end
		it "Prueba febrero" do
			expect(@ref1.get_mes(2)).to eq("febrero")
		end
		it "Prueba marzo" do
			expect(@ref1.get_mes(3)).to eq("marzo")
		end
		it "Prueba abril" do
			expect(@ref1.get_mes(4)).to eq("abril")
		end
		it "Prueba mayo" do
			expect(@ref1.get_mes(5)).to eq("mayo")
		end
		it "Prueba junio" do
			expect(@ref1.get_mes(6)).to eq("junio")
		end
		it "Prueba julio" do
			expect(@ref1.get_mes(7)).to eq("julio")
		end
		it "Prueba agosto" do
			expect(@ref1.get_mes(8)).to eq("agosto")
		end
		it "Prueba septiembre" do
			expect(@ref1.get_mes(9)).to eq("septiembre")
		end
		it "Prueba octubre" do
			expect(@ref1.get_mes(10)).to eq("octubre")
		end
		it "Prueba noviembre" do
			expect(@ref1.get_mes(11)).to eq("noviembre")
		end
		it "Prueba diciembre" do
			expect(@ref1.get_mes(12)).to eq("diciembre")
		end
		it "Prueba para algo que no es un mes" do
			expect{@ref1.get_mes(13)}.to raise_error(RuntimeError, "Numero erroneo de mes")
			expect{@ref1.get_mes(-3)}.to raise_error(RuntimeError, "Numero erroneo de mes")
		end
	end
	describe "Se formatea correctamente el titulo" do
		it "Probando con uno sencillo" do
			expect(@ref8.titulo).to eq("Un Titulo Bien Formateado sin Mayusculas")
		end
	end
end