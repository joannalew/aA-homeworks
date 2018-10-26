class Map
	def initialize
		@map = []
	end

	def set(key, value)
		res = @map.select { |el| el[0] == key }
		if res.empty?
			@map << [key, value]
		else
			res[0][1] = value
		end
	end

	def get(key)
		res = @map.select { |el| el[0] == key }
		if res.empty?
			nil
		else
			res[0][1]
		end
	end

	def delete(key)
		@map.delete_if { |el| el[0] == key }
	end

	def show
		p @map
	end
end

