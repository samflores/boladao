class Team < ApplicationRecord
  validates :name, 
            presence: true,
            uniqueness: true
  validates :short_name,
            presence: true,
            uniqueness: true,
            length: { is: 3 }
end
