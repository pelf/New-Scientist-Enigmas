primes = Array.new(1000, true)

for i in 2...1000
	next unless primes[i]
	for j in 2...1000
		prod = i*j
		break if prod > 1000
		primes[prod] = false
	end
end

prime_nrs = []

for i in 0...1000
	prime_nrs << i if primes[i] and i > 99
end

def encode(nr)
	hash = {'0' => 'A', '1' => 'A', '2' => 'B', '3' => 'B','4' => 'C', '5' => 'C', '6' => 'D', '7' => 'D', '8' => 'E', '9' => 'E'}
	nr = nr.to_s
	enr = ''
	for i in 0...nr.size do
		enr << hash[nr[i,1]]
	end
	return enr
end

prime_nrs_e = prime_nrs.map{|p| encode(p)}

for i in 0...prime_nrs.size do 
	for j in i+1...prime_nrs.size do
		if prime_nrs_e[i] == prime_nrs_e[j]
			puts 'match'
			puts "#{prime_nrs[i]} #{prime_nrs_e[i]}" 
			puts "#{prime_nrs[j]} #{prime_nrs_e[j]}" 
		end
	end
end

puts '--------'

# squares
squares = []

for i in 1...99
	sq = i**2
	next if sq < 100
	break if sq > 999
	squares << sq
end

squares_e = squares.map{|s| encode(s)}

for i in 0...squares.size do 
	for j in i+1...squares.size do
		if squares_e[i] == squares_e[j]
			puts 'match'
			puts "#{squares[i]} #{squares_e[i]}"
			puts "#{squares[j]} #{squares_e[j]}"
		end
	end
end