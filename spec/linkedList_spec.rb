require "spec_helper"

describe LinkedRef::LinkedList do
	before :each do
		@lista = LinkedRef::LinkedList.new
		@lista_insertada = LinkedRef::LinkedList.new
		@lista_insertada.insert_beg(4)
		@lista_insertada.insert_beg(6)
		@lista_insertada.insert_beg(8)
		@lista_insertada.insert_end(3)
		@lista_insertada.insert_end(5)
		@lista_insertada.insert_end(7)
	end
	it "Debe existir el nodo" do
		expect(Struct::Node.new(1, nil)).not_to be_nil
	end
	it "Debe existir la clase LinkedList" do
		expect(LinkedRef::LinkedList.new).not_to be_nil
	end
	it "Debe existir un método para imprimir la lista" do
		expect(@lista.to_s).to eq("[]")
		expect(@lista_insertada.to_s).to eq("[8, 6, 4, 3, 5, 7]")
	end
	describe "Métodos de inserción" do
		it "Por el principio" do
			@lista.insert_beg(4)
			@lista.insert_beg(6)
			@lista.insert_beg(8)
			expect(@lista.to_s).to eq("[8, 6, 4]")
		end
		it "Por el final" do
			@lista.insert_end(3)
			@lista.insert_end(5)
			@lista.insert_end(7)
			expect(@lista.to_s).to eq("[3, 5, 7]")
		end
	end
	describe "Métodos de extracción" do
		it "Por el principio" do
			@lista_insertada.extract_beg
			@lista_insertada.extract_beg
			expect(@lista_insertada.to_s).to eq("[4, 3, 5, 7]")
		end
		it "Por el final" do
			@lista_insertada.extract_end
			@lista_insertada.extract_end
			expect(@lista_insertada.to_s).to eq("[8, 6, 4, 3]")
		end
		it "Lanzar excepciones en caso de extraer estando vacia" do
			expect{@lista.extract_end}.to raise_error(RuntimeError, "List is empty, you can't extract")
			expect{@lista.extract_beg}.to raise_error(RuntimeError, "List is empty, you can't extract")
		end
	end
	describe "Métodos de información y accesores" do
		it "Acceder mediante un índice" do
			expect(@lista_insertada[4].to_s).to eq("5")
			expect(@lista_insertada[2].to_s).to eq("4")
		end
		it "Lanzar excepción en caso de un índice erróneo" do
			expect{@lista[6]}.to raise_error(RuntimeError, "Bad index")
			expect{@lista[-1]}.to raise_error(RuntimeError, "Bad index")
		end
	end
end