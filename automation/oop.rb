f = File.open('OOP-Dnevnik.csv', 'r')
marks = f.read
         .split
         .map { |b| b.split(',')[1..10] }
         .each do |element|
           element = element.map { |e| e.to_f }
           puts element[0].to_i.to_s + " - " + ((element[1..2].sum)/2).to_s
         end
