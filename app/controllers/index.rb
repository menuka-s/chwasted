require 'json'

#$my_coords = [41.8896985,-87.6396759]

# $my_coords = []


post '/search' do
 # puts params
  lat= params[:coords].split(',')[0].to_f
  lng= params[:coords].split(',')[1].to_f
# puts "\n\n\n\n\n\n" + $my_coords[0].to_s + " " + $my_coords[1].to_s + "\n\n\n\n\n"
 session[:coords] = [lat,lng]
p $my_coords = [lat,lng]
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
  erb :nearby_bars
end

get '/' do
  erb :index
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
    # specials_string = bar_dist[0].specials.where(day_id: day_num).join('<br>')
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
  day_num = Time.new.wday + 1
  nearby_bars_with_dist.each do |bar_dist|
    bar = bar_dist[0]
    specials_string = "<ul>"
    bar_dist[0].specials.where(day_id: day_num).each do |special|
      specials_string += "<li>" + special.deal + "</li>"
    end
    specials_string += "</ul>"
    my_coords = session[:coords][0].to_s + "," + session[:coords][1].to_s
    # data << [bar.name, "Chicago, IL", ""]
    data << [bar.name, (bar.address + "Chicago, IL"), specials_string, bar.id, my_coords]
  end

  data.to_json
end
