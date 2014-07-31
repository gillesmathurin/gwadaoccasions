class Provider < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :subscription
  has_many :vehicles, :dependent => :destroy
  has_many :salesmen, :dependent => :destroy

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :login, :company, :address, :zipcode, :city, :state, :telephone, :fax, :mobile, :contact_name, :status
    
  def pending?
    self.status == "pending"
  end
  
  def is_active?
    self.status == "active"
  end
end
