def inventory(n)
	n = n.to_s
	p=0
	f =''
	while p<n.size
		x=n[p,1] # current char
		c=1 # count
		while x==n[p+=1,1]
			c+=1
		end
		f= "#{f}#{c}#{x}"
	end
	f
end

def sum_digits(n)
	sum = 0
	n.to_s.each_char do |i|
		sum += i.to_i
	end
	return sum
end

1111.upto(9999) do |i|
	next if sum_digits(i) < 10
	next unless i.to_s == i.to_s.reverse
	i2 = i
	5.times do
  		i2 = inventory(i2)
  		if i2.index(i.to_s)
   			puts "#{i} #{i2}"
  		end
	end
end
