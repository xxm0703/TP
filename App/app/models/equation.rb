class Equation < ApplicationRecord
	belongs_to :writer, class_name: "Individual"

	validates_associated :writer
	validates :a, presence: true
	validates :b, presence: true
	validates :c, presence: true

end
