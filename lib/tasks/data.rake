namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_sports
    make_roles
    make_sportsman
    make_competition
    make_relation
  end
end
def make_sports
  sportList = ['бег', 'плавание', 'прыжки в длину', 'лыжи', 'прыжки с шестом']
  sportList.each do |title|
    # NOTE: здесь уместнее метод find_or_create_by, чтобы не дублировались
    # виды спорта пнри повторном запуске
    Sport.create(title: title)
  end
end

def make_roles
  rolesList = ['sportsman', 'trener']
  rolesList.each do |role|
    # NOTE: здесь уместнее метод find_or_create_by, чтобы роли не дублировались
    # кроме того, роли лучше вынести в seeds, 
    Role.create(title: role)
  end
end

def make_sportsman
  99.times do |n|
    name  = Faker::Name.first_name
    sername  = Faker::Name.first_name
    sport_id = rand(1..Sport.count)
    Sportsman.create(
      name: name,
      sername: sername,
      sport_id: sport_id,
      user_id: nil)
  end
end

def rand_date(days)
  rand(days).days.ago.to_date
end

def make_competition
  10.times do |competition|
    title = Faker::Team.sport
    date = rand_date(rand(1..31))
    sport_id = rand(1..Sport.count)
    Competition.create(
      title: title,
      date: date,
      sport_id: sport_id
    )
  end
end

def make_relation
  competitions = Competition.all;
  competitions.each do |competition|
    places = Array.new(Sportsman.where({sport_id: competition.sport_id}).count){|elem| elem+1}
    places_new = Array.new()
    result = rand(1..20)
    Sportsman.where({sport_id: competition.sport_id}).each do |sportsman|
      place_ = rand((places - places_new).count)
      place = (places - places_new)[place_]
      Relationship.create(competition_id:competition.id, sportsman_id: sportsman.id, result: place*result, place: place)
      places_new.push(place)
    end
  end
end
