FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 
		'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Find the longest fish in O(n^2) time
def sluggish
	FISH.each_with_index do |el, i|
		max = true

		FISH.each_with_index do |el2, j|
			max = false if el2.length > el.length && i != j
		end

		return el if max
	end
end


# Find the longest fish in O(n log n) time -> mergesort
def merge(left, right)
	res = []

	while !left.empty? && !right.empty?
		if left.first.length < right.first.length
			res << left.shift
		else
			res << right.shift
		end
	end

	return res + left + right
end

def mergesort(arr)
	return arr if arr.length <= 1

	mid = arr.length / 2
	left = mergesort(arr[0...mid])
	right = mergesort(arr[mid..-1])

	return merge(left, right)
end

def dominant
	mergesort(FISH)[-1]
end


# Find the longest fish in O(n) time
def clever
	max = ""

	FISH.each do |el|
		max = el if el.length > max.length
	end

	return max
end


TILES = ["up", "right-up", "right", "right-down", "down", 
				"left-down", "left",  "left-up" ]

# Return the tentacle number (tile index) the octopus must move. 
# This should take O(n) time.
def slow_dance(target, arr)
	arr.each_with_index do |el, i|
		return i if el == target
	end
end


tiles_hash = {"up" => 0, "right-up" => 1, "right"=> 2, "right-down" => 3,
    		  "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }


def fast_dance(dir, hsh)
	hsh[dir]
end