require 'json'

get '/' do
  bars_with_specials_today = []
  day_num = Time.new.wday + 1

  # use array to drop duplicates
  Day.find(day_num).specials.each do |special|
    bars_with_specials_today[special.bar_id] = 1
  end

  max_distance = 1000 # meters
  nearby_bars_with_dist = find_bars_by_dist(bars_with_specials_today, max_distance)

  @bar_specials = {}
  nearby_bars_with_dist.each do |bar_dist|
    @bar_specials[bar_dist] = bar_dist[0].specials.where(day_id: day_num)
  end

  # erb :nearby_bars
  erb :index
end

get '/search' do
  erb :active
end

# for ajax req - returns an array of [bar_id,lat,lng,place_id] arrays for map generation
get '/places' do
  data = []
  bars_with_specials_today = []
  day_num = Time.new.wday + 1

  # use array to drop duplicates
  Day.find(day_num).specials.each do |special|
    bars_with_specials_today[special.bar_id] = 1
  end

  max_distance = 1000 # meters
  nearby_bars_with_dist = find_bars_by_dist(bars_with_specials_today, max_distance)

  nearby_bars_with_dist.each do |bar_dist|
    bar = bar_dist[0]
    data << [bar.id, bar.lat, bar.lng, bar.google_place_id]
  end

  data.to_json
end

get '/places2' do
  data = []
  bars_with_specials_today = []
  day_num = Time.new.wday + 1

  # use array to drop duplicates
  Day.find(day_num).specials.each do |special|
    bars_with_specials_today[special.bar_id] = 1
  end

  max_distance = 1000 # meters
  nearby_bars_with_dist = find_bars_by_dist(bars_with_specials_today, max_distance)

  nearby_bars_with_dist.each do |bar_dist|
    bar = bar_dist[0]
    # data << [bar.name, "Chicago, IL", ""]
    data << [bar.name, (bar.address + "Chicago, IL"), ""]
  end

  data.to_json
end
