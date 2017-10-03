class Competition < ApplicationRecord
	has_many :relationships, dependent: :destroy
	belongs_to :sport
	validates :title, presence: true
	validates :date, presence: true
	validates :sport_id, presence: true
end
