require "spec_helper"

describe LinkedRef::DocumentoElectronico do
	it 'Debe existir a clase' do
		expect(LinkedRef::DocumentoElectronico.new).not_to be_nil
	end
end