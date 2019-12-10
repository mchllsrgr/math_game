class Player
  attr_reader :name
  attr_accessor :score
  attr_accessor :number_of_lives

  def initialize(n)
    @name = n
    @score = 0
    @number_of_lives = 3
  end

  def reduce_number_of_lives
    @number_of_lives -= 1
  end

  def increase_score
    @score += 1
  end
end