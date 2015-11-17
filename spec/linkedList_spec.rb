require "spec_helper"

describe LinkedRef::LinkedList do
	it "Debe existir el nodo" do
		expect(Struct::Node.new(1, nil)).not_to be_nil
	end
	it "Debe existir la clase LinkedList" do
		expect(LinkedRef::LinkedList.new).not_to be_nil
	end
	describe "Métodos de inserción" do

	end
end