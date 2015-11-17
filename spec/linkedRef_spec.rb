require "spec_helper"

describe LinkedRef::LinkedList do
	before :each do
		@lista = LinkedRef::LinkedList.new
		@libro = LinkedRef::Libro.new(["Joanne Rowling"], "Harry Potter y la Piedra Filosofal", Date.new(1997,6,26), "Salamandra", ["2070541274", "847-8885617"], 6)
		@revista = LinkedRef::Revista.new(["Jose Castagnio"], "Técnicas, materiales y aplicaciones en nanotecnología", Date.new(2007, 4, 1), "Acta Bioquímica Clínica Latinoamericana", 2, 41)
		@periodico = LinkedRef::Periodico.new(["Juan Palazon", "Laura Pajuelo"], "El primer móvil con Android One", Date.new(2015, 11, 16), "El País")
		@docElec = LinkedRef::DocumentoElectronico.new(["James Baker"], "Evaluación del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales", Date.new(2000, 1, 1), "http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf")
	end
	describe "La herencia es correcta" do
		#       Referencia
		#       /       \
		#    Libro   PublicacionesPeriodicas
		#               /                \
		#           Articulo     DocumentoElectronico
		#          /       \
		#       Revista Periódico
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
		expect(@lista.to_s).to eq("[Rowling, J.\nHarry Potter y la Piedra Filosofal.\nEd: Salamandra (6)\nISBN-10: 2070541274\nISBN-13: 847-8885617, Castagnio, J.\nTécnicas, materiales y aplicaciones en nanotecnología.\nActa Bioquímica Clínica Latinoamericana, 41 (2), abril 2007., Palazon, J., Pajuelo, L. (16 de noviembre de 2015).\nEl primer móvil con Android One.\nEl País., Baker, J. (2000).\nEvaluación del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales.\nDisponible en http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf]")
	end
end