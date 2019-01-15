class Equation < ApplicationRecord
	belongs_to :individual, required: false
	delegate :name, to: :individual
	validates_associated :individual
	validates :a, presence: true
	validates :b, presence: true
	validates :c, presence: true

end
