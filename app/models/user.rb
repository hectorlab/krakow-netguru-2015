class User < ActiveRecord::Base
  validates :firstname, presence: true
  validates :lastname, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products

  def user_params
    params.require(:user)
    .permit(:firstname, :lastname, :email, :password, :password_confirmation, :remember_me)
  end 

  def admin?
    admin
  end

end
