class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]
   
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for  :image,reject_if: :all_blank
  has_many :posts, dependent: :destroy 
  has_many :comments
  
  has_many :likes
  belongs_to :admin
  has_many :approveroles
  attr_accessor :user_role
  after_create :set_user_role
  
  

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.provider = auth.provider
      user.email = auth.info.email || "#{auth.uid}@#{auth.provider}.com"
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.confirmed_at = Time.now
   end
  end

  def set_user_role
    add_role(user_role) 
  end
 
  def fullname
    "#{self.first_name} #{self.last_name}"
  end
  
 
  def update_without_password(params)
    params.delete(:password)
    params.delete(:password_confirmation)
    params.delete(:current_password)
    update_attributes(params)
  end

  
end
 