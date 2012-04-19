# check if if square is 'magic': 4x4 matrix
def magic?(square)
	checksum = 34
	# check rows
	for i in 0...4 do
		sum = 0
		for j in 0...4 do 
			sum += square[i][j]
		end
		# check if sums are the same
		if sum != checksum 
			return false
		end
	end
	# check cols
	for j in 0...4 do
		sum = 0
		for i in 0...4 do 
			sum += square[i][j]
		end
		# check if sums are the same
		if sum != checksum 
			return false
		end
	end
	# check diagonal
	sum = 0
	for i in 0...4 do
		sum += square[i][i]
	end
	if sum != checksum 
		return false
	end
	return true
end

def init
	return [[0,0,3,0],[5,0,0,0],[0,0,0,12],[0,14,15,0]]
end

def random_fill(square)
	left = [1,2,4,6,7,8,9,10,11,12,13,16]
	for i in 0...4 do
		for j in 0...4 do
			if square[i][j] == 0
				square[i][j] = (left.delete_at rand*left.size)
			end
		end
	end
	return square
end

1000000000.times do
	square = random_fill(init)
	puts square.inspect if magic?(square)
end