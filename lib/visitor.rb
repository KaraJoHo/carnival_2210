class Visitor
  attr_reader :name, :height, :spending_money, :preferences, :visitors

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete('$').to_i
    @preferences =[]
    @visitors = []
  end

  def add_preference(preference)
    @preferences << preference
  end

  def add_visitors(visitor)
    @visitors << visitor
  end

  def tall_enough?(threshold)
    @height >= threshold
  end

  def spend_money(cost_of_ride)
    @spending_money -= cost_of_ride
  end

end
