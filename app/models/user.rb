class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable, :recoverable,
         :rememberable, :trackable, :validatable
         
  validates_presence_of :nickname
  validates_uniqueness_of :nickname

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :activate, :nickname
end
