require "pry"

class Vendor
  attr_reader :name

  attr_accessor :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(food)
    @inventory[food]
  end

  def stock(food, amount)
    @inventory[food] += amount
  end

end
