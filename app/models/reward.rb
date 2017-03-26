class Reward < ActiveRecord::Base

  has_many :branches
  has_one :company, through: :branches
  #belongs_to :user
  #has_many :coupons

  validates :name, presence: true, length: { maximum: 15}, format: {with: /\A[a-zA-ZÑñ0-9\ ]+\z/}
  validates :kms_cost, :available_units, :description, :valid_from, :valid_through, :image, presence: true

end
