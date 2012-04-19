def check(nr)
	return false if nr < 100000 or nr > 999999 
	nrs = nr.to_s
	# check 6 different digits
	for i in 0...6
		for j in i+1...6
			return false if nrs[i] == nrs[j]
		end
	end
	# check VPDs
	begin
		return false if nr % nrs[0,1].to_i != 0 # E
		return false if nr % nrs[1,2].to_i != 0 # NI
		return false if nr % nrs[2,2].to_i != 0 # IG
		return false if nr % nrs[3,1].to_i != 0 # G
		return false if nr % nrs[3,3].to_i != 0 # GMA
		return false if nr % nrs[4,1].to_i != 0 # M
		return false if nr % nrs[4,2].to_i != 0 # MA
		return false if nr % nrs[5,1].to_i != 0 # A
	rescue ZeroDivisionError => e
		return false
	end
	# if we're here, yay!
	return true
end

100000.upto(999999) do |nr|
	puts nr if check(nr)
end