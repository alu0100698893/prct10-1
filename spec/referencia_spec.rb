require "spec_helper"

describe LinkedRef::Referencia do
	before :each do
		@fecha = Date.new(2001, 2, 3)
	end
	describe "Existe la clase referencia" do
		it "Debe exisistir la clase referencia" do
			expect(LinkedRef::Referencia.new(["Jose Sánchez"], "Mi Título", @fecha)).not_to be_nil
		end
	end
end