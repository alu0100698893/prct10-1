require "spec_helper"

describe LinkedRef::LinkedList do
	before :each do
		@lista = LinkedRef::LinkedList.new
		@revista = LinkedRef::Revista.new(["Jose Castagnio"], "Técnicas, materiales y aplicaciones en nanotecnología", Date.new(2007, 4, 1), "Acta Bioquímica Clínica Latinoamericana", 2, 41)
		@artPer = LinkedRef::Periodico.new(["Juan Palazon", "Laura Pajuelo"], "El primer móvil con Android One", Date.new(2015, 11, 16), "El País")
		@docElec = LinkedRef::DocumentoElectronico.new(["James Baker"], "Evaluación del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales", Date.new(2000, 1, 1), "http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf")
	end
	describe "La herencia es correcta" do
		#       referencia
		#       /       \
		#    libro   PublicacionesPeriodicas
		#               /                \
		#           Articulo     DocumentoElectronico
		#          /       \
		#       Revista Periódico
	end
	it "La lista enlazada contiene todos los elmentos" do
		@lista.insert_end(@revista)
		@lista.insert_end(@artPer)
		@lista.insert_end(@docElec)
		expect(@lista.to_s).to eq("[Castagnio, J.\nTécnicas, materiales y aplicaciones en nanotecnología.\nActa Bioquímica Clínica Latinoamericana, 41 (2), abril 2007., Palazon, J., Pajuelo, L. (16 de noviembre de 2015).\nEl primer móvil con Android One.\nEl País., Baker, J. (2000).\nEvaluación del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales.\nDisponible en http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf]")
	end
end