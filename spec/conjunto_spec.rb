# encoding: UTF-8
require "spec_helper"

describe LinkedRef::ConjuntoRef do
	before :all do
		@conjunto = LinkedRef::ConjuntoRef.new
		@libro = LinkedRef::Libro.new(["Gabriel Garcia Marquez"], "Cronicas de una muerte anunciada", 1981, "La Oveja Negra", 4, 1, "Colombia")
		@articulo = LinkedRef::Articulo.new(["Maria Perisco Jimenez", "Pablo Perisco Jimenez"], "Acreditacion en Chile: La experiencia de un lustro", 1997, "Creatividad, educacion y desarrollo", 8, 2, "Chile", "El Estado", ["Eduardo Villalba Garcia", "Godalupe Magana Gonzales"], 27)
		@periodico = LinkedRef::Periodico.new(["Javier Palazon", "Laura Pajuelo"], "El primer movil con Android One", Date.new(2015, 11, 15), "El Pais", 68)
		@docElec = LinkedRef::DocumentoElectronico.new(["James Backer"], "Evaluacion del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales", Date.new(2000, 7, 25), "Web", "Espana", 6, "http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf", "Banco Internacional de Reconstruccion y Fomento/BANCO MUNDIAL", Date.new(2015, 12, 3))

		@conjunto2 = LinkedRef::ConjuntoRef.new
		@conjunto2.insertar(@libro)
		@conjunto2.insertar(@articulo)
		@conjunto2.insertar(@periodico)
		@conjunto2.insertar(@docElec)
	end
	it "Insertar elementos, y ordenar automaticamnete" do
		@conjunto.insertar(@libro)
		@conjunto.insertar(@articulo)
		@conjunto.insertar(@periodico)
		@conjunto.insertar(@docElec)
		expect(@conjunto.to_s).to eq("Backer, J. (25 de julio de 2000). Evaluacion del Impacto de los Proyectos de Desarrollo en la Pobreza: Manual Para Profesionales (6), Web. Espana: Banco Internacional de Reconstruccion y Fomento/BANCO MUNDIAL. Disponible en: http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf (3-12-2015).\nGarcia, M. G. (1981). Cronicas de una Muerte Anunciada (4) (1). Colombia: La Oveja Negra.\nPalazon, J. & Pajuelo, L. (15 de noviembre de 2015). El Primer Movil con Android one. El Pais, pp. 68.\nPerisco, J. M. & Perisco, J. P. (1997). El Estado. En Villalba, G. E. & Magana, G. G. (Eds.), Acreditacion en Chile: la Experiencia de un Lustro (27) (8) (2). Chile: Creatividad, educacion y desarrollo.\n")
	end
	it "Se puede recorrer cada elemento" do
		string = ""
		@conjunto2.each do |i|
			string << i.to_s
			string << "\n"
		end
		expect(string).to eq("Backer, J. (25 de julio de 2000). Evaluacion del Impacto de los Proyectos de Desarrollo en la Pobreza: Manual Para Profesionales (6), Web. Espana: Banco Internacional de Reconstruccion y Fomento/BANCO MUNDIAL. Disponible en: http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf (3-12-2015).\nGarcia, M. G. (1981). Cronicas de una Muerte Anunciada (4) (1). Colombia: La Oveja Negra.\nPalazon, J. & Pajuelo, L. (15 de noviembre de 2015). El Primer Movil con Android one. El Pais, pp. 68.\nPerisco, J. M. & Perisco, J. P. (1997). El Estado. En Villalba, G. E. & Magana, G. G. (Eds.), Acreditacion en Chile: la Experiencia de un Lustro (27) (8) (2). Chile: Creatividad, educacion y desarrollo.\n")
	end
end