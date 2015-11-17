require "spec_helper"

# Se sigue la siguiente convención de nombre:
# Autor[,...]. (año).
# Título.
# Disponible en {url}

# Baker, J. (2000).
# Evaluación del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales.
# Disponible en http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf

# Martínez, E. (2005).
# Estudio de la integración de los medios informáticos en los currículos de educación infantil y primaria.
# Disponible en http://site.ebrary.com/lib/interpuertoricosp

# Michael, S. (2008).
# Programming Language Pragmatics.
# Disponible en http://infoman.teikav.edu.gr/~stpapad/ScottCompilers.pdf

describe LinkedRef::DocumentoElectronico do
	before :each do
		@fecha = Date.new(2001, 2, 3)
		@docElec1 = LinkedRef::DocumentoElectronico.new(["James Baker"], "Evaluación del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales", Date.new(2000, 1, 1), "http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf")
		@docElec2 = LinkedRef::DocumentoElectronico.new(["Enrique Martinez"], "Estudio de la integración de los medios informáticos en los currículos de educación infantil y primaria", Date.new(2005, 1, 1), "http://site.ebrary.com/lib/interpuertoricosp")
		@docElec3 = LinkedRef::DocumentoElectronico.new(["Scott Michael"], "Programming Language Pragmatics", Date.new(2008, 1, 1), "http://infoman.teikav.edu.gr/~stpapad/ScottCompilers.pdf")
	end
	it 'Debe existir a clase' do
		expect(LinkedRef::DocumentoElectronico.new(["Nombre Apellido"], "Mi Título", @fecha, "http://www.dummy.es")).not_to be_nil
	end
	describe "Debe almacenarse correctamente la referencia" do
		it "Referencia Berngueras" do
			expect(@docElec1.to_s).to eq("Baker, J. (2000).\nEvaluación del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales.\nDisponible en http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf")
		end
		it "Referencia Palazon y Pajuelo" do
			expect(@docElec2.to_s).to eq("Martinez, E. (2005).\nEstudio de la integración de los medios informáticos en los currículos de educación infantil y primaria.\nDisponible en http://site.ebrary.com/lib/interpuertoricosp")
		end
		it "Referencia Fresneda" do
			expect(@docElec3.to_s).to eq("Michael, S. (2008).\nProgramming Language Pragmatics.\nDisponible en http://infoman.teikav.edu.gr/~stpapad/ScottCompilers.pdf")
		end
	end
end