class Relationship < ApplicationRecord
	# NOTE: чем обусловлено навзание связи competiotion, отличающееся от названия модели?
	# если название соответствует - не нужно писать class_name.
	# кроме того орфографические ошибки в названиях сущностей и методов - это плохо
	belongs_to :competition, class_name: "Competition"
	belongs_to :sportsman, class_name: "Sportsman"
	validates :competition, presence: true
	validates :sportsman, presence: true
end
