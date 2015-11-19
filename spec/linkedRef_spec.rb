require "spec_helper"

describe LinkedRef::LinkedList do
	before :each do
		@lista = LinkedRef::LinkedList.new
		@libro = LinkedRef::Libro.new(["Joanne Rowling"], "Harry Potter y la Piedra Filosofal", Date.new(1997,6,26), "Salamandra", ["2070541274", "847-8885617"], 6)
		@revista = LinkedRef::Revista.new(["Jose Castagnio"], "Tecnicas, materiales y aplicaciones en nanotecnologia", Date.new(2007, 4, 1), "Acta Bioquimica Clinica Latinoamericana", 2, 41)
		@periodico = LinkedRef::Periodico.new(["Juan Palazon", "Laura Pajuelo"], "El primer movil con Android One", Date.new(2015, 11, 16), "El Pais")
		@docElec = LinkedRef::DocumentoElectronico.new(["James Baker"], "Evaluacion del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales", Date.new(2000, 1, 1), "http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf")
	end
	describe "La herencia es correcta" do
		#       Referencia
		#       /       \
		#    Libro   PublicacionesPeriodicas
		#               /                \
		#           Articulo     DocumentoElectronico
		#          /       \
		#       Revista Periodico
		it "Revista hereda de Articulo" do
			expect(@revista).to be_kind_of(LinkedRef::Articulo)
		end
		it "Periodico hereda de Articulo" do
			expect(@periodico).to be_kind_of(LinkedRef::Articulo)
		end
		it "Ambos heredan de PublicacionesPeriodicas" do
			expect(@revista).to be_kind_of(LinkedRef::PublicacionesPeriodicas)
			expect(@periodico).to be_kind_of(LinkedRef::PublicacionesPeriodicas)
		end
		it "DocumentoElectronico hereda de PublicacionesPeriodicas" do
			expect(@docElec).to be_kind_of(LinkedRef::PublicacionesPeriodicas)
		end
		it "Revista, Periodico y DocumentoElectronico heredan de Referencia" do
			expect(@revista).to be_kind_of(LinkedRef::Referencia)
			expect(@periodico).to be_kind_of(LinkedRef::Referencia)
			expect(@docElec).to be_kind_of(LinkedRef::Referencia)
		end
		it "Libro hereda de Referencia" do
			expect(@libro).to be_kind_of(LinkedRef::Referencia)
		end
	end
	it "La lista enlazada contiene todos los elmentos" do
		@lista.insert_end(@libro)
		@lista.insert_end(@revista)
		@lista.insert_end(@periodico)
		@lista.insert_end(@docElec)
		expect(@lista.to_s).to eq("[Rowling, J.\nHarry Potter y la Piedra Filosofal.\nEd: Salamandra (6)\nISBN-10: 2070541274\nISBN-13: 847-8885617, Castagnio, J.\nTecnicas, materiales y aplicaciones en nanotecnologia.\nActa Bioquimica Clinica Latinoamericana, 41 (2), abril 2007., Palazon, J., Pajuelo, L. (16 de noviembre de 2015).\nEl primer movil con Android One.\nEl Pais., Baker, J. (2000).\nEvaluacion del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales.\nDisponible en http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf]")
	end
	it "Podemos comparar distintos tipos de referencias" do
		expect(@revista>@libro).to be true
		expect(@libro<@revista).to be true
	end
end