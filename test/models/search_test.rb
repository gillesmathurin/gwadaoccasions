require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  test "search by category" do
    car = vehicles(:one)
    search = Search.new(category: 'Voiture')
    assert_includes search.vehicles, car
  end

  test "search by price" do
    car = vehicles(:sp_vehicle)
    search = Search.new(minprice: 1000, maxprice: 10000)
    assert_includes search.vehicles, car
    assert_not_includes search.vehicles, vehicles(:one)
  end

  test "search by kilometrage" do
    car = vehicles(:sp_vehicle)
    search = Search.new(minkilometrage: 10000, maxkilometrage: 15000)
    assert_empty search.vehicles
    search = Search.new(minkilometrage: 10000, maxkilometrage: 150000)
    assert_not_empty search.vehicles
    assert_includes search.vehicles, car
  end

  test "search by year" do
    car = vehicles(:sp_vehicle)
    search = Search.new(minyear: "2000", maxyear: "2014")
    assert_includes search.vehicles, car
  end

  test "search by energy type" do
    search = Search.new(energy: 1)
    search.energy = 0
    assert_not_empty search.vehicles
    assert_includes search.vehicles, vehicles(:sp_vehicle)
  end

  test "search by boite_vitesse type" do
    search = Search.new(boite_vitesse: 1)
    assert_empty search.vehicles
    search = Search.new(boite_vitesse: 0)
    assert_not_empty search.vehicles
    assert_equal 2, search.vehicles.size
  end

  test "search with multiple criterias" do
    search = Search.new(boite_vitesse: 0, minyear: "2000", minkilometrage: 1)
    assert_equal 2, search.vehicles.size
  end
end
