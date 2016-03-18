# require '/Users/apprentice/iank/chwasted/config/environment'
# require '/Users/apprentice/iank/chwasted/app/models/day'


Day.create({id: 1, name: "Sunday"})
Day.create({id: 2, name: "Monday"})
Day.create({id: 3, name: "Tuesday"})
Day.create({id: 4, name: "Wednesday"})
Day.create({id: 5, name: "Thursday"})
Day.create({id: 6, name: "Friday"})
Day.create({id: 7, name: "Saturday"})
Day.create({id: 8, name: "Pimpday"})


name = ""
address = ""
phone = ""
Dir.entries("/Users/apprentice/iank/chwasted/db/scrape").each do |file|
  specials_array = []
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
        if !( item =~ /None/)
          specials_array << {day_id: i, deal: item}
        end
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
  bar = Bar.create({name: name, address: address, phone: phone})
  specials_array.each do |special|
    special["bar_id"] = bar.id
    Special.create(special)
  end
end

# Special.where(deal: " None").each { |x| x.destroy }
