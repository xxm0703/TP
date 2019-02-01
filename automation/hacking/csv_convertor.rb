filepath = ARGV[0]
path = File.dirname(filepath)

fd = File.open(filepath)

content = fd.read.split("\n").
map {|e| e.split[1..-1].join(',')}.
join("\n")


fd.close

File.open(path + '/converted.txt', mode="w") do |fd|

    fd.write(content)

end