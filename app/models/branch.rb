class Branch < ActiveRecord::Base

  belongs_to :company
  has_many :rewards
  # belongs_to :reward
  
  #belongs_to :employees


  validates :name, :address, uniqueness: true, presence: true, length: { maximum: 250 }
  validates :phone, :latitude, :longitude, :city, presence: true
end
