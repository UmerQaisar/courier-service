class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validations
  validates :name, presence: true
  validates :contact, presence: true , numericality: {only_integer: true , message: 'Number can only contain digits'}, length: {minimum: 7}

  # associations
  has_many :travel_details, dependent: :destroy
  has_many :orders, dependent: :destroy

end
