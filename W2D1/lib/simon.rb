class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(val=1)
  	@sequence_length = val
  	@game_over = false
  	@seq = []
  end

  def play
  	while !game_over
  		take_turn
  	end
  	game_over_message
  	reset_game
  end

  def take_turn
  	show_sequence
  	require_sequence
	if !game_over
	 	round_success_message
		@sequence_length += 1
  	end
  end

  def show_sequence
  	@seq.clear

  	i = 0
  	while i < @sequence_length
  		puts " #{i + 1}. #{add_random_color}"
  		sleep(0.5)
  		system "clear"
  		i += 1
  	end
  end

  def require_sequence
  	i = 0
  	endings = ['st', 'nd', 'rd']

  	while i < @sequence_length
  		ending = 'th'
  		if i < 3
  			ending = endings[i]
  		end

		print "Enter the #{i + 1}#{ending} color: "
		input = gets.chomp

		if input != @seq[i]
			@game_over = true
			break
		end

		i += 1
	end
  end

  def add_random_color
  	options = ['red', 'blue', 'yellow', 'green']
  	@seq << options.sample
  	return seq[-1]
  end

  def round_success_message
  	puts "You got all the colors! Good job!"
  end

  def game_over_message
  	puts "You entered the wrong color! You lose!"
  end

  def reset_game
  	@sequence_length = 1
  	@game_over = false
  	@seq = []
  end
end
