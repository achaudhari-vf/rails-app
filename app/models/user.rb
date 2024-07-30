class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :rememberable, :recoverable,
         :jwt_authenticatable, jwt_revocation_strategy: self

    has_many :flights

    validates :name , presence: true
    
    validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }


end