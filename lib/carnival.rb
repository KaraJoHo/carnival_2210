class Carnival
  attr_reader :duration, :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride_obj)
    @rides << ride_obj
  end

  def popular_ride

    popular = []
      @rides.each do |ride|
        if ride.rider_log.empty? == false
          popular << ride
        end
      end
        popular.max_by do |ride|
          ride.rider_log.count
      end
    end

    def total_revenue
      @rides.sum do |ride|
        ride.total_revenue
      end
    end

    def most_profitable_ride
      @rides.max_by do |ride|
        ride.total_revenue
      end
    end
  end
