require "spec_helper"

describe LinkedRef::ArticuloPeriodico do
	it 'Debe existir a clase' do
		expect(LinkedRef::ArticuloPeriodico.new).not_to be_nil
	end
end