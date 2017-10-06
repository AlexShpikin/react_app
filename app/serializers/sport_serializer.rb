class SportSerializer < ActiveModel::Serializer
  attributes :id, :title, :sportsmans, :competitions, :data, :points
  has_many :sportsmans
  has_many :competitions

  def sportsmans
  	object.sportsmans.count
  end

  def competitions
  	object.competitions.count
  end

  def data
  	object.competitions.as_json(only: [:title], methods: :competitions)
  end

  def points
  	object.competitions.as_json(only: [:title], methods: :results)
  end
end
