require "spec_helper"

describe LinkedRef::Articulo do
	before :all do
		@fecha = Date.new(2001, 2, 3) #@articulo = LinkedRef::Articulo.new()
		@articulo = LinkedRef::Articulo.new(["Maria Perisco Jimenez", "Pablo Perisco Jimenez"], "Acreditacion en Chile: La experiencia de un lustro", 1997, "Creatividad, educacion y desarrollo", 8, 2, "Chile", "El Estado", ["Eduardo Villalba Garcia", "Godalupe Magana Gonzales"], 27)
	end
	it "Debe existir a clase" do
		expect(LinkedRef::Articulo.new(["Maria Perisco Jimenez", "Pablo Perisco Jimenez"], "Acreditacion en Chile: La experiencia de un lustro", 1997, "Creatividad, educacion y desarrollo", 8, 2, "Chile", "El Estado", ["Eduardo Villalba Garcia", "Godalupe Magana Gonzales"], 27)).not_to be_nil
	end
	describe "Debe almacenarse correctamente la referencia" do
		it "Articulo de ejemplo del readme" do
			expect(@articulo.to_s).to eq("Perisco, J. M. & Perisco, J. P. (1997). El Estado. En Villalba, G. E. & Magana, G. G. (Eds.), Acreditacion en Chile: la Experiencia de un Lustro (27) (8) (2). Chile: Creatividad, educacion y desarrollo.")
		end
	end
end