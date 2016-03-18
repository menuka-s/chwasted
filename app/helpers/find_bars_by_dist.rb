def find_bars_by_dist(bars, max_dist)
  nearby_bars_with_dist = []
  my_coords = [41.8896985,-87.6396759]
  bars.each_index do |i|
    if bars[i] == 1
      bar = Bar.find(i)
      bar_coords = [bar.lat, bar.lng]
      dist = distance(my_coords, bar_coords)
      if dist <= max_dist
        nearby_bars_with_dist << [bar, dist]
      end
    end
  end
  nearby_bars_with_dist
  sorted_nearby_bars_with_dist = nearby_bars_with_dist.sort {|a,b| a[1] <=> b[1]}
end
