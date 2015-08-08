class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

 # ROLE_TYPES = ["seller","buyer"]
 # validates :role_type, inclusion:ROLE_TYPES
  private
  def default_role
    self.roles << Role.where(:name => 'User').first
  end
end
