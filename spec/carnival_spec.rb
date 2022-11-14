require './lib/ride'
require './lib/visitor'
require './lib/carnival'

RSpec.describe Carnival do
  it 'exists and has attributes' do
    carnival = Carnival.new('10 hours')

    expect(carnival).to be_a(Carnival)
    expect(carnival.duration).to eq('10 hours')
    expect(carnival.rides).to eq([])
  end

  describe '#add_ride' do
    it 'adds a ride to the carnival rides array' do
      carnival = Carnival.new('10 hours')
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })

      expect(carnival.rides).to eq([])
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      expect(carnival.rides).to eq([ride1, ride2])
    end
  end

  describe '#popular_ride' do
    xit 'can show the most popular ride at the carnival' do
      carnival = Carnival.new('10 hours')
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor3)
      ride2.board_rider(visitor1)

      expect(carnival.popular_ride).to eq([ride1])
    end
  end

  describe '#total_revenue' do
    it 'can show the total revenue earned from al the rides' do
      carnival = Carnival.new('10 hours')
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      expect(carnival.total_revenue).to eq(0)
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor3)
      ride2.board_rider(visitor1)
      expect(carnival.total_revenue).to eq(8)
    end
  end
end
