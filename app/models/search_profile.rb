class SearchProfile < ActiveRecord::Base
  belongs_to :user
  validates :minprice, presence: true
  validates :maxprice, presence: true
  validate :search_profile_count, on: :create

  scope :with_price_and_kilometer_criterias, ->(price,kilometrage) { where('minprice <= ? AND maxprice >= ? AND minkilometer <= ? AND maxkilometer >= ?',
      price, price, kilometrage, kilometrage) }
    
  private
  
  def search_profile_count
    count = SearchProfile.where(user_id: self.user_id).count
    errors.add_to_base("Vous avez atteint le nombre maximum de profils. Veuillez modifier un profil existant.") if count == 5
  end
end
