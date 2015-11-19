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
	it "Debe existir un metodo para imprimir la lista" do
		expect(@lista.to_s).to eq("[]")
		expect(@lista_insertada.to_s).to eq("[8, 6, 4, 3, 5, 7]")
	end
	describe "Metodos de insercion" do
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
	describe "Metodos de extraccion" do
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
	describe "Metodos de informacion y accesores" do
		it "Acceder mediante un indice" do
			expect(@lista_insertada[4].to_s).to eq("5")
			expect(@lista_insertada[2].to_s).to eq("4")
		end
		it "Lanzar excepcion en caso de un indice erroneo" do
			expect{@lista[6]}.to raise_error(RuntimeError, "Bad index")
			expect{@lista[-1]}.to raise_error(RuntimeError, "Bad index")
		end
		it "Metodo para obtener el tamaño" do
			expect(@lista_insertada.size.to_s).to eq("6")
		end
		it "Hacer una enumeracion" do
			str = "["
			@lista_insertada.each{|i|
				str << i.to_s << ", "
			}
			str << "]"
			expect(str).to eq("[8, 6, 4, 3, 5, 7, ]")
		end
		it "Obtener el maximo de la lista" do
			expect(@lista_insertada.max.to_s).to eq("8")
		end
	end
end