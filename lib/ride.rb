class Ride
  attr_reader :name, :min_height, :admission_fee,
              :excitement, :total_revenue, :rider_log, :boarding_riders
  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end


  def board_rider(visitor)
    #board the riders one by one
    #the visitor will be the key of the hash and the times they boarded
    #is the value
    #get the visitor object and set that to they key of rider rider_log
    #increment their visits by one each time they board
    if rider_log.include?(visitor)
      @rider_log[visitor] += 1
    else
      @rider_log[visitor] = 1
    end
    @total_revenue += admission_fee
    #visitor.spending_money -= @admission_fee

    #returning as undefined method 'spending_money =' for visitor obj
  end
end
