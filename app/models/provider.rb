class Provider < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :subscription
  has_many :vehicles, :dependent => :destroy
  has_many :salesmen, :dependent => :destroy

  #Enums
  enum status: [:pending, :active]
end
