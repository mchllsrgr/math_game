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

  def ask_question
    q = Question.new
    puts "#{@current_player}: What does #{q.num1} plus #{q.num2} equal?"
  end


end