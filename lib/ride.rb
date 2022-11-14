class Ride
  attr_reader :name, :min_height, :admission_fee,
              :excitement, :total_revenue, :rider_log, :boarding_riders
  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @total_revenue = 0
    @rider_log = []
    #require 'pry' ;binding.pry
    @boarding_riders = []
  end

  def board_rider(visitor_obj)
    @boarding_riders << visitor_obj
  end

  def rider_log
    #keep track of the amount of times each rider goes on a ride
    #go through the riders in the array
    #the rider is the key and the amount of times they rode is the value
    #keep track of the times they rode
    #the rider is the key and the tims the rode is the value
    @boarding_riders.each do |visitor|
      if visitor.name == visitor.name
      @rider_log[visitor] = @boarding_riders.count
    end
    end
  end
end
