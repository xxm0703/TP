class Individual < ApplicationRecord
	has_many :equations
	validates :name, length: {minimum: 2}
end
