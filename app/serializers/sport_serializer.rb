class SportSerializer < ActiveModel::Serializer
  attributes :id, :title, :sportsmans_count, :competitions_count

  def sportsmans_count
  	object.sportsmans.count
  end

  def competitions_count
  	object.competitions.count
  end

end
