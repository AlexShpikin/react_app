class Sportsman < ApplicationRecord
	has_many :relationships, dependent: :destroy
	belongs_to :sport
end
