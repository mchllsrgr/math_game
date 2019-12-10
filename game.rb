class Game
  attr_accessor :current_player

  def initialize
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @current_player = @player_1
  end

  def change_current_player
    if @current_player == @player_1
      @current_player = @player_2
    elsif @current_player == @player_2
      @current_player = @player_1
    end
  end

  def create_new_round
    q = Question.new
    puts "#{@current_player.name}: What does #{q.num1} plus #{q.num2} equal?"
    player_answer = gets.chomp.to_i

    if player_answer == q.correct_answer
      puts "You are correct!"
      @current_player.increase_score
    elsif player_answer != q.correct_answer
      puts "You are wrong"
      @current_player.reduce_number_of_lives
    end

    self.compare_lives
  end

  def compare_lives
    puts "P1: #{@player_1.number_of_lives}/3 vs P2: #{@player_2.number_of_lives}/3"
  end

  def continue_game?
    while @player_1.number_of_lives > 0 && @player_2.number_of_lives > 0 do
      self.create_new_round
      self.change_current_player
    end
    
    puts "GAME OVER"
  end
  
end