require "spec_helper"

describe LinkedRef::LinkedList do
	before :each do
		@lista = LinkedRef::LinkedList.new
	end
	it "Debe existir el nodo" do
		expect(Struct::Node.new(1, nil)).not_to be_nil
	end
	it "Debe existir la clase LinkedList" do
		expect(LinkedRef::LinkedList.new).not_to be_nil
	end
	it "Debe existir un método para imprimir la lista" do
		expect(@lista.to_s).to eq("[]")
	end
	describe "Métodos de inserción" do
		it "Por el principio" do
			@lista.insert_beg(4)
			expect(@lista.to_s).to eq("[4]")
		end
		it "Por el final" do
			@lista.insert_end(3)
			expect(@lista.to_s).to eq("[3]")
		end
	end
end