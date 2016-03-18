# require '/Users/apprentice/iank/chwasted/config/environment'
# require '/Users/apprentice/iank/chwasted/app/models/day'

puts "KJDHFKJSHFJ"

Day.find_or_create_by({id: 1, name: "Sunday"})
Day.find_or_create_by({id: 2, name: "Monday"})
Day.find_or_create_by({id: 3, name: "Tuesday"})
Day.find_or_create_by({id: 4, name: "Wednesday"})
Day.find_or_create_by({id: 5, name: "Thursday"})
Day.find_or_create_by({id: 6, name: "Friday"})
Day.find_or_create_by({id: 7, name: "Saturday"})
Day.find_or_create_by({id: 8, name: "Pimpday"})

fuckup_count = 0
non_fuckup_count = 0
name = ""
address = ""
phone = ""
Dir.chdir(APP_ROOT.to_s + "/db/scrape")
	puts "XXX"
Dir.entries(".").each do |file|
  specials_array = []
  bar_id = file.split('.')[0]
  next if file == '.'
  next if file == '..'
  puts "Working on #{file}"
  i = 1

  File.new(file).each do |line|
  	puts "here"
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
    # special["bar_id"] = bar.id
    new_spec = Special.new(special)
    new_spec.bar_id = bar.id
    if new_spec.bar_id != nil
	    new_spec.save
	    non_fuckup_count += 1
	else 
		fuckup_count += 1
	end
  end
end

puts fuckup_count.to_s + " fuckups reported out of " + non_fuckup_count.to_s + " possible fuckups, for a fuckup rate of " + (fuckup_count / non_fuckup_count.to_f).round(5).to_s 

# Special.where(deal: " None").each { |x| x.destroy }
