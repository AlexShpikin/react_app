class Relationship < ApplicationRecord
	# NOTE: чем обусловлено навзание связи competiotion, отличающееся от названия модели?
	# если название соответствует - не нужно писать class_name.
	# кроме того орфографические ошибки в названиях сущностей и методов - это плохо
	belongs_to :competition
	belongs_to :sportsman
	validates :competition, presence: true
	validates :sportsman, presence: true

	def name
		sportsman.name
	end

	def sername
		sportsman.sername
	end
	
	def all_results
		competition.relationships.pluck(:result)
	end
end
