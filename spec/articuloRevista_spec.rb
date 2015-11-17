require "spec_helper"

describe LinkedRef::ArticuloRevista do
	it 'Debe existir a clase' do
		expect(LinkedRef::ArticuloRevista.new).not_to be_nil
	end
end