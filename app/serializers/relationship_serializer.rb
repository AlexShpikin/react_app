class RelationshipSerializer < ActiveModel::Serializer
  	attributes :competition_id, :result, :all_results, :name, :sername, :place

  	def all_results
  		Relationship.where(competition_id: object.competition_id).pluck(:result)
  	end
  
  	def name
    	Sportsman.find(object.sportsman_id).read_attribute(:name)
  	end

   	def sername
    	Sportsman.find(object.sportsman_id).read_attribute(:sername)
  	end
end
