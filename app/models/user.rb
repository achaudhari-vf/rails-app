class User < ApplicationRecord

    has_many :flights

    validates :name , presence: true
    
    validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

    has_secure_password

end