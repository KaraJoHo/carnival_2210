require './lib/ride'
require './lib/visitor'
require './lib/carnival'

RSepc.describe Carnival do
  it 'exists and has attributes' do
    carnival = Carnival.new('10 hours')

    expect(carnival).to be_a(Carnival)
    expect(carnival.duration).to eq('10 hours')
    expect(carnival.rides).to eq([])
  end
end
