class Role < ApplicationRecord
	before_save :uniq_title?
	validates :title, presence: true
	def uniq_title?
		if Role.find_by(title: self.title).present?
			puts 'Такой уже есть'
		else
			puts 'Такого нет'
		end	 	 
	end
end
