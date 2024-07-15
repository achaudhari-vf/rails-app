class Flight < ApplicationRecord
    validates :source, :destination, :price, presence: true
end
