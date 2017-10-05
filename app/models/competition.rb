class Competition < ApplicationRecord
	has_many :relationships, dependent: :destroy
	belongs_to :sport
	validates :title, presence: true
	validates :date, presence: true
	validates :sport_id, presence: true
	def competitions
		relationships.count
	end
	def results
		relationships.pluck(:result)
	end
end
