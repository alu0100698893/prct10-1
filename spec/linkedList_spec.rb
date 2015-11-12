require "spec_helper"

describe LinkedRef::LinkedList do
	before :each do
		@dummy=1
	end
	describe "Existe la estructura nodo" do
		it "Debe existir el nodo" do
			expect(Struct::Node.new(1, nil)).not_to be_nil
		end
	end
end