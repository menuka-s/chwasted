get '/' do
  bars_with_specials_today = []
  day_num = Time.new.wday + 1

  # use array to drop duplicates
  Day.find(day_num).specials.each do |special|
    bars_with_specials_today[special.bar_id] = 1
  end

  p bars_with_specials_today

  max_distance = 1000 # meters
  nearby_bars = find_bars_by_dist(bars_with_specials_today, max_distance)

  @bar_specials = {}
  nearby_bars.each do |bar|
    @bar_specials[bar] = bar.specials.where(day_id: day_num)
  end

  erb :nearby_bars
end
