output = File.new("handle_batch_into_staging.txt", "w")
input = File.open("prod_handles.csv").read
input.gsub!(/\r\n?/, "\n") #replace end of line characters
input.gsub!(/\"/, "") #replace quotes with nothing


input.each_line do |line|
	l = line.split(',')
	output.puts("CREATE #{l[0]}")
	output.puts("100 HS_ADMIN 86400 1110 ADMIN 200:111111111111:0.NA/2166.DEV") # This line will have to change, specifically the 2166.DEV part
	output.puts("1 URL 86400 1110 UTF8 https://rosebud.library.northwestern.edu/testurl_#{l[1]}") #make sure to change #{l[1]} to the proper array index
	output.puts("")
end

output.close