filepath = ARGV[0]
path = File.dirname(filepath)

content = nil

File.open(filepath) do |fd|
  content = fd.read.split("\n")
              .map { |e| e.split[1..-1].join(',') }
              .join("\n")
end

File.open(path + '/converted.txt', 'w') { |fd| fd.write(content) }
