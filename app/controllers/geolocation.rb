get '/xxx' do
  erb :geotest
end

get '/address' do
  Bar.first.id.to_s + ":" + Bar.first.address.gsub(' ','+')
end

get '/address/:id' do
  bar = Bar.find(params[:id].to_i)
  bar.id.to_s + ":" + bar.address.gsub(' ','+') + "Chicago+IL"
end


# Disabled so the db doesn't get fucked

post '/address' do
  address = params[:address].gsub('+',' ').gsub('Chicago IL','')
  bar = Bar.find_by(address: address)
  params.delete("splat")
  params.delete("captures")
  params.delete("id")
  params.delete("address")
  bar.update_attributes(params)

end


get '/specials/:id' do
  bars_with_specials_today = []
  day_num = Time.new.wday + 1

  special_list = Day.find(day_num).specials.each.where(bar_id: params[:id])

  special_list.to_json
end
