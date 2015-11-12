require "spec_helper"

describe LinkedRef::Referencia do
	before :each do
		@dummy=1
	end
	describe "Existe la clase referencia" do
		it "Debe exisistir la clase referencia" do
			expect(LinkedRef::Referencia.new).not_to be_nil
		end
	end
end