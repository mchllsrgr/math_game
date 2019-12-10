class Game
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
    puts "#{@current_player}: What does #{q.num1} plus #{q.num2} equal?"
    player_answer = gets.chomp.to_i

    if player_answer == q.correct_answer
      puts "You are correct!"
      @current_player.increase_score
    elsif player_answer != q.correct_answer
      puts "You are wrong"
      @current_player.reduce_number_of_lives
    end
  end

  def compare_lives
    puts "#{@player_1.number_of_lives} and #{player_2.number_of_lives}"
  end

end