# Game mechanics :
# Setting the default parameters : grid and the player who's in turn
# Showing the grid with the reference to guide player's choices
# Get the player's choice and ensure that it was within the available choice
# Check the grid after the choice made then :
# 1° Announce a winner if there is a winning combination;
# 2° Announce a draw if all the available choices were made and there is no winning combination;
# 3° Get the next player's choice if there was no winning combination and available choices.
# You can execute the game by using the command "ruby main.rb" in the terminal.

# Class for all the mechanics for the game.
class TicTacToe
  # Setting the default parameters
  attr_accessor :current_player, :grid

  def initialize
    @current_player = 'player_One'
    @grid = Array.new(9, '-')
    @choice = ''
    @index = ''
  end

  # 1-1- The Grid with the reference and the instruction
  # Instructions
  def play
    puts 'To play this game, use a number between 1 and 9'
    puts 'You can refer to the following grid to how the cases are referenced'
    display_reference_grid
    puts 'This is the grid for the grid for the current game.'
    display_grid
    making_choice
    checking_results
  end

  # Displaying the reference grid showing the cases and numbers correspondances to play the game
  def display_reference_grid
    puts '|1|2|3|'
    puts '|4|5|6|'
    puts '|7|8|9|'
  end

  # Method for displaying the grid of the current game
  def display_grid
    puts "|#{grid[0]}|#{grid[1]}|#{grid[2]}|"
    puts "|#{grid[3]}|#{grid[4]}|#{grid[5]}|"
    puts "|#{grid[6]}|#{grid[7]}|#{grid[8]}|"
  end

  # Getting the user's input.
  def making_choice
    puts "It is #{@current_player} turn to make a choice."
    @choice = gets
    @choice = @choice.chomp
    @index = @choice.to_i - 1

    # Condition to allow only numbers between 1 and 9 as choices available and only to cases not already taken
    until @choice.to_i.positive? && @choice.to_i <= 9 && @grid[@index] == '-'
      @choice = gets
      @choice = @choice.chomp
      @index = @choice.to_i - 1
    end
    # Ensuring to give a player the correct value
    if @current_player == 'player_One'
      @grid[@index] = 'O'
      @current_player = 'player_Two'
    else
      @grid[@index] = 'X'
      @current_player = 'player_One'
    end
    display_grid
  end

  # Checking the grid with all the combinations to get the situtation and annoucing the results or continuing the game.
  def checking_results
    if @grid[0] == 'O' && @grid[1] == 'O' && @grid[2] == 'O'
      puts 'Player One won!'
    elsif @grid[3] == 'O' && @grid[4] == 'O' && @grid[5] == 'O'
      puts 'Player One won!'
    elsif @grid[6] == 'O' && @grid[7] == 'O' && @grid[8] == 'O'
      puts 'Player One won!'
    elsif @grid[0] == 'O' && @grid[3] == 'O' && @grid[6] == 'O'
      puts 'Player One won!'
    elsif @grid[1] == 'O' && @grid[4] == 'O' && @grid[7] == 'O'
      puts 'Player One won!'
    elsif @grid[3] == 'O' && @grid[5] == 'O' && @grid[8] == 'O'
      puts 'Player One won!'
    elsif @grid[0] == 'O' && @grid[4] == 'O' && @grid[8] == 'O'
      puts 'Player One won!'
    elsif @grid[2] == 'O' && @grid[4] == 'O' && @grid[6] == 'O'
      puts 'Player One won!'
    elsif @grid[0] == 'X' && @grid[1] == 'X' && @grid[2] == 'X'
      puts 'Player Two won!'
    elsif @grid[3] == 'X' && @grid[4] == 'X' && @grid[5] == 'X'
      puts 'Player Two won!'
    elsif @grid[6] == 'X' && @grid[7] == 'X' && @grid[8] == 'X'
      puts 'Player Two won!'
    elsif @grid[0] == 'X' && @grid[3] == 'X' && @grid[6] == 'X'
      puts 'Player Two won!'
    elsif @grid[1] == 'X' && @grid[4] == 'X' && @grid[7] == 'X'
      puts 'Player Two won!'
    elsif @grid[3] == 'X' && @grid[5] == 'X' && @grid[8] == 'X'
      puts 'Player Two won!'
    elsif @grid[0] == 'X' && @grid[4] == 'X' && @grid[8] == 'X'
      puts 'Player Two won!'
    elsif @grid[2] == 'X' && @grid[4] == 'X' && @grid[6] == 'X'
      puts 'Player Two won!'
    elsif @grid.none?('-')
      puts 'It is a draw!'
    else
      making_choice
      checking_results
    end
  end
end

game_one = TicTacToe.new
game_one.play
