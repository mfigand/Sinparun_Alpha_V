class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :branches
  has_many :rewards
  has_many :employees
  #has_many :rewards, through: :branches
  #has_many :employees, through: :branches


  validates :name, :email, uniqueness: true, presence: true, length: { maximum: 250 }
  validates :password, presence: true

end
