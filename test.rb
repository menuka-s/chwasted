my_coords = [41.8896985,-87.6396759]

results = {}

Bar.all.each do |bar|
  bar_coords = [bar.lat, bar.lng]
  dist = distance(bar_coords, my_coords).round(2)
  puts "Distance to #{bar.name}: #{dist}"
  results[bar.id] = dist
end

sorted_results = results.sort_by {|k,v| v}
sorted_results.each {|k,v| puts "#{k} - #{v} meters"}
