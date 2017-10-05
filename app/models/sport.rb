class Sport < ApplicationRecord
	has_many :sportsmans, dependent: :destroy
	has_many :competitions, dependent: :destroy
	validates :title, presence: true, uniqueness: true
	# NOTE: не хватает валидации уникальности. когда в системе будет
	# несоклько одиннаковых видов спорта - будет ничего не понятно
end
