class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over == true
    self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    puts "Memorize the sequence you have 3 seconds"
    self.show_sequence
    sleep(3)
    p system "clear"
    self.require_sequence
    if self.game_over == false
      self.round_success_message
       puts "streak:  #{self.sequence_length}"
      self.sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    p seq
  end

  def require_sequence
    @seq.each do |color|
      puts "please give color"
      guess = gets.chomp
      if color != guess
        return self.game_over = true
      end
    end
  end

  def add_random_color
    colors = %w(red blue yellow green)
    seq << colors.sample
  end

  def round_success_message
    puts "great job!  On to next round"
  end

  def game_over_message
    puts "oh no you lost"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end

end

game = Simon.new

game.play