require 'rspec'
require './lib/visitor'
require './lib/ride'

RSpec.describe Visitor do
  it 'exists and has attributes' do
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(visitor1).to be_a(Visitor)
    expect(visitor1.name).to eq("Bruce")
    expect(visitor1.height).to eq(54)
    expect(visitor1.spending_money).to eq(10)
    expect(visitor1.preferences).to eq([])
  end

  describe '#add_preference' do
    it 'adds preferences to the visitor array' do
      visitor1 = Visitor.new('Bruce', 54, '$10')

      expect(visitor1.preferences).to eq([])
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:water)
      expect(visitor1.preferences).to eq([:gentle, :water])
    end
  end

  describe '#add visitor' do
    it 'adds visitor to the visitor array' do
      visitor1 = Visitor.new('Bruce', 54, '$10')

      visitor1.add_visitors(visitor1)

      expect(visitor1.visitors).to eq([visitor1])
    end
  end

  describe '#tall_enough?' do
    it 'returns true or false if the visitor is tall enough based on a threshold' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      visitor1.add_visitors(visitor1)
      visitor2.add_visitors(visitor2)
      visitor3.add_visitors(visitor3)


      expect(visitor1.tall_enough?(54)).to eq(true)
      expect(visitor2.tall_enough?(54)).to eq(false)
      expect(visitor3.tall_enough?(54)).to eq(true)
      expect(visitor1.tall_enough?(64)).to eq(false)
    end
  end

  describe '#spend_money' do
    it 'reduces the riders spending money when they board' do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.spend_money(1)

      expect(visitor1.spending_money).to eq(9)
    end
  end
end
