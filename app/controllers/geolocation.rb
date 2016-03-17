get '/' do
  erb :geotest
end

get '/address' do
  Bar.first.id.to_s + ":" + Bar.first.address.gsub(' ','+')
end

get '/address/:id' do
  bar = Bar.find(params[:id].to_i+1)
  bar.id.to_s + ":" + bar.address.gsub(' ','+') + "Chicago+IL"
end

post '/address/:id' do
  bar = Bar.find(params[:id])
  params.delete("splat")
  params.delete("captures")
  params.delete("id")
  bar.update_attributes(params)

end
