class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new([:stone, :stone, :stone, :stone]) }
    @cups = @cups.map.with_index do |ele, i| 
      if i == 6 || i == 13
        ele = []
      else
        ele
      end
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos > 14
      raise "Invalid starting cup"
    end
   if cups[start_pos].length == 0
      raise "Starting cup is empty"
   end
        
   
  end

  def make_move(start_pos, current_player_name)
    trigger = false
    if start_pos < 7 && start_pos > 0
      start_pos -= 1
      trigger = true
    end

  
    arr = self.cups[start_pos]
    l = arr.length
    self.cups[start_pos] = []
    i = 1
    until arr.length == 0
      if trigger
        self.cups[(start_pos + i) % 14] << arr.pop if (start_pos + i) % 14 != 13
      else
        self.cups[(start_pos + i) % 14] << arr.pop if (start_pos + i) % 14 != 6
      end
        i += 1
     
    end
    render
    next_turn((start_pos + i - 1)%14)
  end

  def next_turn(ending_cup_idx)
      if ending_cup_idx == 6 || ending_cup_idx == 13
        return :prompt

      end
      if self.cups[ending_cup_idx].length != 0
        return ending_cup_idx
      end
     
        
      return :switch
      
    
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if self.cups[0..6].all? { |ele| ele.empty? } || self.cups[7..12].all? { |ele| ele.empty? }
      return true
    end
    false
  end

  def winner
    case self.cups[6] <=> self.cups[13]
    when -1
      return @name2
    when 1
      return @name1
    when 0
      return :draw
    end

  end
end
