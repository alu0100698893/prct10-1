require "spec_helper"

describe LinkedRef::DocumentoElectronico do
	before :each do
		@fecha = Date.new(2001, 2, 3)
		@fecha_eje = Date.new(2000, 7, 25)
		@fecha_ejeacc = Date.new(2015, 12, 3)
		@docElec = LinkedRef::DocumentoElectronico.new(["James Backer"], "Evaluacion del impacto de los proyectos de desarrollo en la pobreza: Manual para profesionales", @fecha_eje, "Web", "Espana", 6, "http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf", "Banco Internacional de Reconstruccion y Fomento/BANCO MUNDIAL", @fecha_ejeacc)
	end
	it 'Debe existir a clase' do
		#(autores, titulo, fecha, formato, pais, edicion, url, editor, fecha_acc)
		expect(LinkedRef::DocumentoElectronico.new(["Nombre Apellido"], "Mi Titulo", @fecha, "Web", "Espana", 1, "http://www.dummy.es", "Periodicos de aqui Unidos", @fecha)).not_to be_nil
	end
	describe "Debe almacenarse correctamente la referencia" do
		it "Referencia Berngueras" do
			expect(@docElec.to_s).to eq("Backer, J. (25 de julio de 2000). Evaluacion del Impacto de los Proyectos de Desarrollo en la Pobreza: Manual Para Profesionales (6), Web. Espana: Banco Internacional de Reconstruccion y Fomento/BANCO MUNDIAL. Disponible en: http://siteresources.worldbank.org/INTISPMA/Resources/Impact-Evaluation-Handbook--Spanish-/manual.pdf (3-12-2015).")
		end
	end
end