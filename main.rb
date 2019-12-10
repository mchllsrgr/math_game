require "./game"
require "./question"
require "./player"

game = Game.new
game.create_new_round
game.continue_game?