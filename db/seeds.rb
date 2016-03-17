# require '/Users/apprentice/iank/chwasted/config/environment'
# require '/Users/apprentice/iank/chwasted/app/models/day'


Day.create({name: "Sunday"})
Day.create({name: "Monday"})
Day.create({name: "Tuesday"})
Day.create({name: "Wednesday"})
Day.create({name: "Thursday"})
Day.create({name: "Friday"})
Day.create({name: "Saturday"})
Day.create({name: "Pimpday"})


name = ""
address = ""
phone = ""
Dir.entries("/Users/apprentice/iank/chwasted/db/scrape").each do |file|
  bar_id,foo,bar = file.split('.')
  next if file == '.'
  next if file == '..'
  puts "Working on #{file}"
  i = 1
  File.new("/Users/apprentice/iank/chwasted/db/scrape/" + file).each do |line|
    line_info = line.chomp
    if i < 8
      day = Day.find(i).name
      puts day + " " + line_info
      line_info.split(',').each do |item|
        Special.create({day_id: i, bar_id: bar_id, deal: item})
      end
    else
      if line_info =~ /^NAME/
        name = line_info.gsub(/^NAME:/,'')
      end
      if line_info =~ /^INFO/

        add_phone = line_info.gsub(/^INFO: /,'')
        (address,phone) = add_phone.split('%%');
        puts "Address: " + address
        puts "Phone: " + phone
      end
    end
    i += 1
  end
    if name == "" || address == ""
      puts "Blank value on #{bar_id}"
      gets
    end
   Bar.create({name: name, address: address, phone: phone})
end



