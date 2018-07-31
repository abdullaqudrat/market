require "pry"

class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(food)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(food)
    end
  end

  def sorted_item_list
    @vendors.map do |vendor|
      vendor.inventory.keys
    end.flatten.uniq.sort
  end

  def total_inventory
    hash = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |key, value|
        hash[key] += value
      end
    end
    hash
  end

  def check_total_inventory(food, amount)
    total_inventory[food] >= amount
  end

  def remove_item(food, amount)
    found_vendors = []
    @vendors.each do |vendor|
      vendor.inventory.each do |key, value|
        if key == food
          found_vendors  << vendor
        end
      end
    end
    found_vendors.each do |vendor|
      vendor.inventory[food] -= 1 && amount -= 1 until vendor.inventory[food] == 0 || amount == 0
    end
  end

  def sell(food, amount)
    if check_total_inventory(food, amount) == true
      remove_item(food, amount)
    end
  end

end
