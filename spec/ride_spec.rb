require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  it 'exists and has attributes' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    expect(ride1).to be_a(Ride)
    expect(ride1.name).to eq("Carousel")
    expect(ride1.min_height).to eq(24)
    expect(ride1.admission_fee).to eq(1)
    expect(ride1.excitement).to eq(:gentle)
    expect(ride1.total_revenue).to eq(0)
    expect(ride1.rider_log).to eq([])
  end

  describe '#board_rider' do
    it 'adds rider to an array to use for the rider log' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)

      expect(ride1.boarding_riders).to eq([])

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)

      expect(ride1.boarding_riders).to eq([visitor1, visitor2, visitor1])
    end
  end

  describe '#rider_log' do
    xit 'has an hash of riders and adds the visitors and amount of times they boarded' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)

      expected = {visitor1 => 2, visitor2 => 1}
      expect(ride1.rider_log).to eq(expected)

    end
  end
end
