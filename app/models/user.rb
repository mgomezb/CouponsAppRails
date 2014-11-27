class User < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email
  has_many :locals, through: :user_locals
  has_many :user_locals

  has_many :user_coupons
  has_many :coupons, through: :user_coupons

end
