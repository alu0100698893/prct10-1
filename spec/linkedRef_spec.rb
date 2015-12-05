require "spec_helper"

describe LinkedRef::LinkedList do
	before :each do
		@lista = LinkedRef::LinkedList.new
		@libro = LinkedRef::Libro.new(["Gabriel Garcia Marquez"], "Cronicas de una muerte anunciada", 1981, "La Oveja Negra", 4, 1, "Colombia")
		@articulo = LinkedRef::Articulo.new(["Maria Perisco Jimenez", "Pablo Perisco Jimenez"], "Acreditacion en Chile: La experiencia de un lustro", 1997, "Creatividad, educacion y desarrollo", 8, 2, "Chile", "El Estado", ["Eduardo Villalba Garcia", "Godalupe Magana Gonzales"], 27)
		@periodico = LinkedRef::Periodico.new(["Javier Palazon", "Laura Pajuelo"], "El primer movil con Android One", Date.new(2015, 11, 15), "El Pais", 68)
		@docElec = LinkedRef::DocumentoElectronico.new(["James Backer"], "Evaluacion del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales", Date.new(2000, 7, 25), "Web", "Espana", 6, "http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf", "Banco Internacional de Reconstruccion y Fomento/BANCO MUNDIAL", Date.new(2015, 12, 3))
	end
	describe "La herencia es correcta" do
		#        Referencia
		#       /          \
		#    Libro      PublicacionesPeriodicas
		#      |          /                \
		#    Articulo  Periodico     DocumentoElectronico

		it "Libro hereda de referencia" do
			expect(LinkedRef::Libro).to be < LinkedRef::Referencia
		end
		it "Articulo hereda de libro" do
			expect(LinkedRef::Articulo).to be < LinkedRef::Libro
		end
		it "Publicaciones periodicas hereda de referencia" do
			expect(LinkedRef::PublicacionesPeriodicas).to be < LinkedRef::Referencia
		end
		it "Periodico hereda de PublicacionesPeriodicas" do
			expect(LinkedRef::Periodico).to be < LinkedRef::PublicacionesPeriodicas
		end
		it "DocumentoElectronico hereda de PublicacionesPeriodicas" do
			expect(LinkedRef::DocumentoElectronico).to be < LinkedRef::PublicacionesPeriodicas
		end
	end
	it "La lista enlazada contiene todos los elmentos" do
		@lista.insert_end(@libro)
		@lista.insert_end(@revista)
		@lista.insert_end(@periodico)
		@lista.insert_end(@docElec)
		expect(@lista.to_s).to eq("[Garcia, M. G. (1981). Cronicas de una Muerte Anunciada (4) (1). Colombia: La Oveja Negra., , Palazon, J. & Pajuelo, L. (15 de noviembre de 2015). El Primer Movil con Android one. El Pais, pp. 68., Backer, J. (25 de julio de 2000). Evaluacion del Impacto de los Proyectos de Desarrollo en la Pobreza: Manual Para Profesionales (6), Web. Espana: Banco Internacional de Reconstruccion y Fomento/BANCO MUNDIAL. Disponible en: http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf (3-12-2015).]")
	end
	it "Podemos comparar distintos tipos de referencias" do
		expect(@articulo<@libro).to be false
		expect(@libro>@articulo).to be false
	end
end