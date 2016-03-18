name=""
changes = {}

Dir.entries("/Users/apprentice/iank/chwasted/db/scrape").each do |file|
  bar_id,foo,bar = file.split('.')
  next if file == '.'
  next if file == '..'
  puts "Working on #{file}"

  old_id = file.split('.')[0]

  File.new("/Users/apprentice/iank/chwasted/db/scrape/" + file).each do |line|
    line_info = line.chomp
    if line_info =~ /^NAME/
      name = line_info.gsub(/^NAME:/,'')
    end
  end # file


  new_id = Bar.find_by(name: name).id
  Special.where(bar_id: old_id).each { |x| changes["#{old_id}"] = new_id }
end # Dir

changes.each do |k,v|
  Special.where(bar_id: k).each {|x| x.bar_id=v; x.save}
end

