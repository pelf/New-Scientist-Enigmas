# radius: exact nr meters
# slabs: 1x1m
# cut 1/3 of slabs
# total nr slabs?
# ----

MAX_SLABS_RADIUS = 100

# check only a quarter of the circle, the rest is simetric
# try different radiuses
for radius in 1..MAX_SLABS_RADIUS
	slabs = 0
	cut = 0
	# cycle through the slabs
	for x in 0...radius
		for y in 0...radius
			# is slab inside, outside or cut?
			# pitagoras ftw: closer corner
			hyp = Math.sqrt(x*x + y*y)
			if hyp < radius # it's not outside
				slabs += 1
				# it's either inside or cut
				# pitagoras ftw: farther corner
				hyp = Math.sqrt((x+1)**2 + (y+1)**2)
				if hyp > radius # cut
					cut += 1
				end
			end
		end
	end
	if cut*1.0 == slabs/3.0
		puts "radius: #{radius}, used #{slabs*4} slabs, cut #{cut*4}"
		break
	end
end