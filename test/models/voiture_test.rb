require 'test_helper'

class VoitureTest < ActiveSupport::TestCase

  def valid_attributes
    {
      price: 1,
      kilometrage: 1,
      annee: Date.today,
      immatriculation: "ASX 345 971",
      serialnumber: (Random.new(1234).rand * 1000000000).round,
      modele: "MyString",
      marque_id: 1,
      cylindree: "MyString",
      energy: "MyString",
      boite_vitesse: "MyString",
      description: "MyText"
    }
  end 

  test 'required modele price kilometrage energy boite_vitesse attributes on creation' do
    vehicle = Voiture.new
    refute vehicle.save, "Require attributes"
    vehicle = Voiture.new(valid_attributes)
    assert vehicle.save!, "All attributes "
  end
end
