def find_bars_by_dist(bars, max_dist)
p bars
  nearby_bars = []
  my_coords = [41.8896985,-87.6396759]
  bars.each_index do |i|
    if bars[i] == 1
      bar = Bar.find(i)
      bar_coords = [bar.lat, bar.lng]
      dist = distance(my_coords, bar_coords)
      if dist <= max_dist
        nearby_bars << bar
      end
    end
  end
  p nearby_bars
  nearby_bars
end
