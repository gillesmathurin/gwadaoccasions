class Provider < ActiveRecord::Base
  has_one :subscription
  has_many :vehicles, :dependent => :destroy
  has_many :salesmans, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable #, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :login, :company, :address, :zipcode, :city, :state, :telephone, :fax, :mobile, :contact_name, :status
    
  def pending?
    self.status == "pending"
  end
end
