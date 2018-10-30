class Board
  attr_accessor :cups

  def initialize(name1, name2)
  	@p1 = name1
  	@p2 = name2
  	@cups = Array.new(14) { Array.new(4, :stone) }
  	@cups[6].clear
  	@cups[13].clear
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
  	if start_pos < 0 || start_pos > 13
  		raise 'Invalid starting cup'
  	elsif @cups[start_pos].empty?
  		raise 'Starting cup is empty'
  	end
  end

  def make_move(start_pos, current_player_name)
    # empties cup
    stones = @cups[start_pos]
    @cups[start_pos] = []

    # distributes stones
    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      # places stones in the correct current player's cups
      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  	# helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      # ended on store -- get to choose where to start again
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      # ended on empty cup -- switches players' turns
      :switch
    else
      # ended on cup with stones in it -- automatically starts there
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  	s1 = true
  	s2 = true

  	(0..5).each do |i|
  		s1 = false if !@cups[i].empty?
  		s2 = false if !@cups[i + 7].empty?
  	end

  	return s1 || s2
  end

  def winner
  	if @cups[6].length == @cups[13].length
  		return :draw
  	elsif @cups[6].length > @cups[13].length
  		return @p1
  	else
  		return @p2
  	end
  end
end
