class Flight < ApplicationRecord
    belongs_to :user
    validates :source, :destination, :price, presence: true
end
