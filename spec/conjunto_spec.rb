# encoding: UTF-8
require "spec_helper"

describe LinkedRef::ConjuntoRef do
	before :all do
		@conjunto = LinkedRef::ConjuntoRef.new
		@libro = LinkedRef::Libro.new(["Gabriel Garcia Marquez"], "Cronicas de una muerte anunciada", 1981, "La Oveja Negra", 4, 1, "Colombia")
		@articulo = LinkedRef::Articulo.new(["Maria Perisco Jimenez", "Pablo Perisco Jimenez"], "Acreditacion en Chile: La experiencia de un lustro", 1997, "Creatividad, educacion y desarrollo", 8, 2, "Chile", "El Estado", ["Eduardo Villalba Garcia", "Godalupe Magana Gonzales"], 27)
		@periodico = LinkedRef::Periodico.new(["Javier Palazon", "Laura Pajuelo"], "El primer movil con Android One", Date.new(2015, 11, 15), "El Pais", 68)
		@docElec = LinkedRef::DocumentoElectronico.new(["James Backer"], "Evaluacion del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales", Date.new(2000, 7, 25), "Web", "Espana", 6, "http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf", "Banco Internacional de Reconstruccion y Fomento/BANCO MUNDIAL", Date.new(2015, 12, 3))
	end
	it "Insertar elementos, y ordenar automaticamnete" do
		@conjunto.insertar(@libro)
		@conjunto.insertar(@articulo)
		@conjunto.insertar(@periodico)
		@conjunto.insertar(@docElec)
		puts @conjunto.to_s
	end
end