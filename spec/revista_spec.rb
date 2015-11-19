require "spec_helper"

# Formato de revista:
# Autor[, ...]
# Titulo del articulo.
# Titulo de la revista, [Volumen] (numero), fecha

# Castagnio, J.
# Tecnicas, materiales y aplicaciones en nanotecnologia.
# Acta Bioquimica Clinica Latinoamericana, 41 (2), abril 2007.

# Perisco, P., Perisco, C.
# Acreditacion en Chile la experiencia de un lustro.
# Creatividad, educacion y desarrollo, (25), agosto 1997.

# Valdes, H., aviles, P., Mandakovic, B.
# La tierra se toma la revancha?: calentamiento global.
# Conozca mas, 19 (10), octubre 2008.

describe LinkedRef::Revista do
	before :each do
		@fecha = Date.new(2001, 2, 3)
		@revista1 = LinkedRef::Revista.new(["Jose Castagnio"], "Tecnicas, materiales y aplicaciones en nanotecnologia", Date.new(2007, 4, 1), "Acta Bioquimica Clinica Latinoamericana", 2, 41)
		@revista2 = LinkedRef::Revista.new(["Pedro Perisco", "Carmen Perisco"], "Acreditacion en Chile la experiencia de un lustro", Date.new(1997, 8, 1), "Creatividad, educacion y desarrollo", 25)
		@revista3 = LinkedRef::Revista.new(["Hector Valdes", "Paula Aviles", "Bogdashha Mandakovic"], "La tierra se toma la revancha?: calentamiento global", Date.new(2008, 10, 1), "Conozca mas", 10, 19)
	end
	it "Debe existir a clase" do
		expect(LinkedRef::Revista.new(["Nombre Apellido"], "Mi Titulo", @fecha, "Dummy", 1, 1)).not_to be_nil
	end
	describe "Debe almacenarse correctamente la referencia" do
		it "Referencia Castagnio" do
			expect(@revista1.to_s).to eq("Castagnio, J.\nTecnicas, materiales y aplicaciones en nanotecnologia.\nActa Bioquimica Clinica Latinoamericana, 41 (2), abril 2007.")
		end
		it "Referencia Perisco" do
			expect(@revista2.to_s).to eq("Perisco, P., Perisco, C.\nAcreditacion en Chile la experiencia de un lustro.\nCreatividad, educacion y desarrollo, (25), agosto 1997.")
		end
		it "Referencia Valdes" do
			expect(@revista3.to_s).to eq("Valdes, H., Aviles, P., Mandakovic, B.\nLa tierra se toma la revancha?: calentamiento global.\nConozca mas, 19 (10), octubre 2008.")
		end
	end
	it "Debe poder ser comparable" do
		expect(@revista1>@revista3).to be true
		expect(@revista3<@revista1).to be true
	end
end