class Relationship < ApplicationRecord
	belongs_to :competiotion, class_name: "Competition"
	belongs_to :sportsman, class_name: "Sportsman"
	validates :competiotion, presence: true
	validates :sportsman, presence: true
end
