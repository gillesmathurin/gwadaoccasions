require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  test "vehicle must have a built year" do
    vehicle = Vehicle.new
    refute vehicle.save, "Saved the vehicle without an 'annee'"
  end

  test "vehicle must have a serial number" do
    vehicle = Vehicle.new(annee: Date.today, immatriculation: "848 AZT 971")
    refute vehicle.save, "Saved the vehicle without a serial number"
  end

  test "vehicle must have an immatriculation" do
    vehicle = Vehicle.new(annee: Date.today, serialnumber: "AZERTYU")
    refute vehicle.save, "Saved the vehicle without an immatriculation"
    vehicle.immatriculation = "848 AZT 971"
    assert vehicle.save
  end

  test "must have an unique immatriculation" do
    vehicle = Vehicle.create(annee: Date.today, serialnumber: "AZERTYUOP", immatriculation: "848 AZT 971")
    vehicle2 = Vehicle.new(annee: Date.today, serialnumber: "AZERTYU", immatriculation: "848 AZT 971")
    refute vehicle2.save, "Saved the vehicle with immatriculation duplicate"
  end

  test "#display_year return only the annee's attribute year" do
    vehicle = Vehicle.create(annee: Date.today, serialnumber: "AZERTYUOP", immatriculation: "848 AZT 971")
    assert_equal 2014, vehicle.display_year, "Doesn't return the Year"
  end

  test "#matching_searchprofiles returns saved search profiles matching vehicle" do
    sp = search_profiles(:one)
    vehicle = vehicles(:sp_vehicle)
    assert_includes(vehicle.matching_searchprofiles, sp)
  end

  test "#share_me post vehicle creation event on twitter and facebook" do
    skip("not implemented yet")
  end

  test "#of_the_week scope fetches vehicles which are selected for the current week" do
    vehicle = vehicles(:one)
    assert_equal(2, Vehicle.of_the_week.size,)
    assert_includes(Vehicle.of_the_week, vehicle, "Doesn't include the vehicle")
  end

  test '#sold scope fetches sold vehicles' do
    assert_equal(1, Vehicle.sold.size)
    assert_includes(Vehicle.sold ,vehicles(:two), "Doesn't include the vehicle")
    assert_not_includes( Vehicle.sold, vehicles(:one) )
  end

  test '#available scope fetches availabe vehicles' do
    assert_equal(2, Vehicle.available.size)
    assert_includes(Vehicle.available, vehicles(:one), "Doesn't include the vehicle")
    assert_not_includes(Vehicle.available, vehicles(:two))
  end

  test 'scope with_price_criterias fetches vehicle mathcing given price criteria' do
    assert_equal(1, Vehicle.with_price_criterias('Voiture', 1, 10).size)
    assert_includes(Vehicle.with_price_criterias('Voiture', 0, 10), vehicles(:one))
  end
end
