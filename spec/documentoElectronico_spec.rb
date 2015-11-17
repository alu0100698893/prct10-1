require "spec_helper"

describe LinkedRef::DocumentoElectronico do
	before :each do
		@fecha = Date.new(2001, 2, 3)
	end
	it 'Debe existir a clase' do
		expect(LinkedRef::DocumentoElectronico.new(["Jose Sánchez"], "Mi Título", @fecha)).not_to be_nil
	end
end