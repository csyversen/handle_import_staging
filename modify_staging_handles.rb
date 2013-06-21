output = File.new("handle_staging_batch_modify.txt", "w")
input = File.open("handles17JUNE2013.txt").read
input.gsub!(/\r\n?/, "\n") #replace end of line characters
input.gsub!(/\"/, "") #replace quotes with nothing
input.gsub!(/https:\/\/rosebud.library.northwestern.edu\/dms\/mastervideo\//,"http://mastervideo-dev.library.northwestern.edu/mastervideo/current/") #replace rosebud domain to mastervideo-dev domain
input.gsub!(/MEDIA/,"STG") #replace MEDIA to STG

input.each_line do |line|
	l = line.split(',')
	output.puts("MODIFY "+l[0])
	output.puts("1 URL 86400 1110 UTF8 #{l[1]}")
	output.puts("")
end

output.close