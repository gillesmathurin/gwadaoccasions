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
    skip("need to refactor this method in its own service")
  end

  test "#tweet_me post a tweet after vehicle creation" do
    skip("need refactoring and twitter webservice mocking")
  end
end
