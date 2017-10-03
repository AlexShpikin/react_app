class Sport < ApplicationRecord
	has_many :sportsmans, dependent: :destroy
	has_many :competitions, dependent: :destroy
	validates :title, presence: true
end
