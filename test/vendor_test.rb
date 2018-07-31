require './lib/vendor.rb'
require 'minitest/autorun'
require 'minitest/pride'


class VendorTest < Minitest::Test

  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end

  def test_it_has_name
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_it_starts_with_no_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal ({}), vendor.inventory
  end

  def test_it_can_check_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 0, vendor.check_stock("Peaches")
  end

  def test_it_can_stock_amount_of_food
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 30, vendor.stock("Peaches", 30)
  end

  def test_inventory_can_add_food_amount
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    assert_equal 30, vendor.check_stock("Peaches")
    vendor.stock("Peaches", 25)
    assert_equal 55, vendor.check_stock("Peaches")
  end

  def test_inventory_can_hold_different_foods
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    vendor.stock("Tomatoes", 12)
    assert_equal ({"Peaches"=>55, "Tomatoes"=>12}), vendor.inventory
  end
end
