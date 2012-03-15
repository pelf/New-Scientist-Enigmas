# find primes in the first 1000 integers
primes = Array.new(1000,true)
for i in 2...1000
	next unless primes[i]
	for j in 2...1000
		prod = i*j
		break if prod > 1000
		primes[prod] = false
	end
end

prime_nrs = []

for i in 2...1000
	prime_nrs << i if primes[i]
end
#puts prime_nrs.inspect

products = []
products_primes = {}

# find products of two primes with 2 digits
prime_nrs.each do |i|
	prime_nrs.each do |j|
		next if i == j # they need to be different
		p = i*j
		break if p > 200
		if p > 9 # and have 2 digits
			products << p 
			products_primes[p] = [i,j]
		end
	end
end
#puts products.sort.inspect

products.uniq!.sort!

# pair products and check their difference and sum for 'primeness'
products.each do |p1|
	break if p1 > 99
	products.each do |p2|
		break if p2 > 99
		dif = (p1-p2).abs
		# is the difference a product of primes?
		next unless products.include? dif
		sum = p1+p2
		# and the sum?
		next unless products.include? sum
		# prime factors must be distinct
		break if (products_primes[p1]+products_primes[p2]+products_primes[dif]+products_primes[sum]).uniq.size < 8
		puts "match: #{p1}, #{p2}, #{dif}, #{sum}"
		puts (products_primes[p1]+products_primes[p2]+products_primes[dif]+products_primes[sum]).inspect
	end
end
	