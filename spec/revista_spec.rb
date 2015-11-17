require "spec_helper"

# Formato de revista:
# Autor[, ...]
# Título del artículo.
# Título de la revista, [Volumen] (número), fecha

# Castagnio, J.
# Técnicas, materiales y aplicaciones en nanotecnología.
# Acta Bioquímica Clínica Latinoamericana, 41 (2), abril 2007.

# Perisco, P., Perisco, C.
# Acreditación en Chile la experiencia de un lustro.
# Creatividad, educación y desarrollo, (25), agosto 1997.

# Valdés, H., Áviles, P., Mandakovic, B.
# ¿La tierra se toma la revancha?: calentamiento global.
# Conozca más, 19 (10), octubre 2008.

describe LinkedRef::Revista do
	before :each do
		@fecha = Date.new(2001, 2, 3)
		@revista1 = LinkedRef::Revista.new(["Jose Castagnio"], "Técnicas, materiales y aplicaciones en nanotecnología", Date.new(2007, 4, 1), "Acta Bioquímica Clínica Latinoamericana", 2, 41)
		@revista2 = LinkedRef::Revista.new(["Pedro Perisco", "Carmen Perisco"], "Acreditación en Chile la experiencia de un lustro", Date.new(1997, 8, 1), "Creatividad, educación y desarrollo", 25)
		@revista3 = LinkedRef::Revista.new(["Hector Valdes", "Paula Aviles", "Bogdashha Mandakovic"], "¿La tierra se toma la revancha?: calentamiento global", Date.new(2008, 10, 1), "Conozca más", 10, 19)
	end
	it "Debe existir a clase" do
		expect(LinkedRef::Revista.new(["Nombre Apellido"], "Mi Título", @fecha, "Dummy", 1, 1)).not_to be_nil
	end
	describe "Debe almacenarse correctamente la referencia" do
		it "Referencia Castagnio" do
			expect(@revista1.to_s).to eq("Castagnio, J.\nTécnicas, materiales y aplicaciones en nanotecnología.\nActa Bioquímica Clínica Latinoamericana, 41 (2), abril 2007.")
		end
		it "Referencia Perisco" do
			expect(@revista2.to_s).to eq("Perisco, P., Perisco, C.\nAcreditación en Chile la experiencia de un lustro.\nCreatividad, educación y desarrollo, (25), agosto 1997.")
		end
		it "Referencia Valdés" do
			expect(@revista3.to_s).to eq("Valdes, H., Aviles, P., Mandakovic, B.\n¿La tierra se toma la revancha?: calentamiento global.\nConozca más, 19 (10), octubre 2008.")
		end
	end
end