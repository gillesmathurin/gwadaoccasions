class SearchProfile < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :minprice, :maxprice, :on => :create, :message => "doit être renseigné."
  validate_on_create :search_profile_count
  
  protected
  
  def search_profile_count
    count = SearchProfile.all(:conditions => ["user_id = ?", self.user_id]).count
    if count == 5
      errors.add_to_base("Vous avez atteint le nombre maximum de profils. Veuillez modifier un profil existant.")
    end
  end
end
