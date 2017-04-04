class Branch < ActiveRecord::Base

  belongs_to :company
  has_many :rewards
  has_many :employees
  # belongs_to :reward
  # belongs_to :employee


  validates :name, :address, uniqueness: true, presence: true, length: { maximum: 250 }
  validates :phone, :latitude, :longitude, :city, presence: true
end
