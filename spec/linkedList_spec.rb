require "spec_helper"

describe LinkedRef::LinkedList do
	it "Debe existir el nodo" do
		expect(Struct::Node.new(1, nil)).not_to be_nil
	end
end