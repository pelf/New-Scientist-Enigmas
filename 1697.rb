1.upto 100 do |n|
	if n.even?
		count = 2**(n/2)
	else
		count = 2**((n+1)/2)
	end
	puts "n=#{n}, count=#{count}" if n == count
end

# the answer is 6. n = 4, 6 = 0110