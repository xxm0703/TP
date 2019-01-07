money = [1, 0] 

while TRUE do
	if money[0] > money[1]
		money[0] -= 1
		money[1] += 5
	elsif money[1] > money[0]
		money[1] -= 1
		money[0] += 5
	else
		puts money[0]
		break
	end

end



