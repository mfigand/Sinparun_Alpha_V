class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :km

  validates :name, presence: true, length: { maximum: 250 }
  validates :email, uniqueness: true
  validates :password, presence: true, format: {with: /\A[a-zA-ZÑñ0-9\ ]+\z/}
  # validates :password, length: { minumum: 8 }
  # validates_each :password do |record, attr, value|
  #   record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  #   end
  # /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,}$/

  has_attached_file :avatar, styles: {
   medium: "300x300>",
   small: "200x200!",
   xsmall: "150x150>",
   thumb: "100x100>",
   original: "1024x1024"},
   default_url: '/images/Favicon.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.new_runner_nike(current_user,params)
    #New users get 10kms for free
    new_runner_nike = Km.create(sinparun_kms:10,
     total_kms:10,
     nike_last_total_kms:params[:totalDistance].to_i,
     level: 1, races: 1, user_id:current_user.id)
  end

  def self.new_nike_account(current_user,params)
    current_user.km.nike_last_total_kms = params[:totalDistance].to_i
    current_user.km.save
    current_user.km
  end

  def self.update_runner_nike(current_user,params)
    user_kms = current_user.km
    if params[:totalDistance].to_i > user_kms.nike_last_total_kms
      nike_new_kms = params[:totalDistance].to_i - user_kms.nike_last_total_kms
      user_kms.sinparun_kms = user_kms.sinparun_kms + nike_new_kms
      user_kms.total_kms = user_kms.total_kms + nike_new_kms
      user_kms.nike_last_total_kms = params[:totalDistance].to_i
      kms = user_kms.total_kms
      level = kms/100 == 0 ? 1 : (kms/100 + 1)
      user_kms.level = level
      user_kms.races = user_kms.races + 1
      user_kms.save
      user_kms
   else
    user_kms
   end
  end

  def self.new_runner_runtastic(current_user,params)
    current_user_kms = Km.create(sinparun_kms:100,
     total_kms:100,
     runtastic_last_total_kms:params[:totalDistance].to_i,
     level: 1, races: 1, user_id:current_user.id)
  end

  def self.new_runtastic_account(current_user,params)
    user_kms = current_user.km
    user_kms.runtastic_last_total_kms = params[:totalDistance].to_i
    user_kms.save
    user_kms
  end

  def self.update_runner_runtastic(current_user,params)
    user_kms = current_user.km
    if params[:totalDistance].to_i > user_kms.runtastic_last_total_kms
      runtastic_new_kms = params[:totalDistance].to_i - user_kms.runtastic_last_total_kms
      user_kms.sinparun_kms = user_kms.sinparun_kms + runtastic_new_kms
      user_kms.total_kms = user_kms.total_kms + runtastic_new_kms
      user_kms.runtastic_last_total_kms = params[:totalDistance].to_i
      kms = user_kms.total_kms
      level = kms/100 == 0 ? 1 : (kms/100 + 1)
      user_kms.level = level
      user_kms.races = user_kms.races + 1
      user_kms.save
      user_kms
   else
    user_kms
   end
  end

end
