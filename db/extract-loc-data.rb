locs = {}
Bar.all.each do |bar|
  locs[bar.id] = [bar.lat, bar.lng, bar.google_place_id ]
end
p locs
