#left comments to show thought process
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
    #find the ride that had the most riders
    #we have rides in the rides array
    #each ride has a log which has the number of times
    #it was boarded
    #find the max number of times the ride was boarded
    #return that ride as the popular one

    #first idea is to make an array to collect the popular_ride
    #iterate through rides and check if any logs are empty
    #if they are not empty, shovel them in to the array
    #check that array for the highest value using max by

    popular = []
      @rides.each do |ride|
        if ride.rider_log.empty? == false
          popular << ride
        end
      end
      popular.max_by do |ride|
        require 'pry' ;binding.pry
        ride.rider_log.count
      end
    end

    #second idea, just use max by to find the highest value
    #by the rider count
    #
    # @rides.max_by do |ride|
    #   #require 'pry' ;binding.pry
    #   ride.rider_log.count
    # end

    def total_revenue
      @rides.sum do |ride|
        ride.total_revenue
      end
    end
  end
