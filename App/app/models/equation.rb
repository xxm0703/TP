class Equation < ApplicationRecord
	belongs_to :individual, required: false
	validates_associated :individual
	validates :a, presence: true
	validates :b, presence: true
	validates :c, presence: true

end
