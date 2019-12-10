class Game
  attr_accessor :current_player, :winner
  @@number_of_questions = 0

  def initialize
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @current_player = @player_1
    @winner = nil
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
    @@number_of_questions += 1
    puts "#{@current_player.name}: What does #{q.num1} plus #{q.num2} equal?"
    player_answer = gets.chomp.to_i

    if player_answer == q.correct_answer
      puts "#{@current_player.name}: You are correct!"
      @current_player.increase_score
    elsif player_answer != q.correct_answer
      puts "#{@current_player.name}: You are wrong"
      @current_player.reduce_number_of_lives
    end

    self.compare_lives
  end

  def compare_lives
    puts "P1: #{@player_1.number_of_lives}/3 vs P2: #{@player_2.number_of_lives}/3"
  end

  def calculate_winner
    if @player_1.score > @player_2.score
      @winner = @player_1
    elsif @player_2.score > @player_1.score
      @winner = @player_2
    end
  end

  def continue_game?
    while @player_1.number_of_lives > 0 && @player_2.number_of_lives > 0 do
      puts "--- NEW TURN ---"
      self.change_current_player
      self.create_new_round
    end
    
    self.calculate_winner
    puts "#{@winner.name} wins with a score of #{@winner.score}/#{@@number_of_questions}"
    puts "--- GAME OVER ---"
  end
  
end