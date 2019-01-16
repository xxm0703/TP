class Individual < ApplicationRecord
	has_many :equations, foreign_key: "writer_id", dependent: :destroy
	validates :name, length: {minimum: 2}
end
