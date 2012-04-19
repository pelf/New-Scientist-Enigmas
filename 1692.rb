def check(nr)
	return false if nr < 123456789 or nr > 987654321
	nrs = nr.to_s
	# check 9 different digits
	for i in 0...9
		for j in i+1...9
			return false if nrs[i] == nrs[j]
		end
	end
	both = false
	# check neighbors
	for i in 0...9
		count = 0
		# compare with previous
		if i > 0
			count += 1 if (nrs[i,1].to_i - nrs[i-1,1].to_i).abs == 1
		end
		# compare with next
		if i < 8
			count += 1 if (nrs[i,1].to_i - nrs[i+1,1].to_i).abs == 1
		end
		return false if count == 0
		return false if both and count == 2
		both = (count == 2)
	end
	# check divisible
	count = 0
	1.upto(12) do |d|
		count += 1 if nr % d == 0
	end
	if count > 9
		return true
	else
		return false
	end
end

123456789.upto(987654321) do |nr|
	puts nr if check(nr)
end