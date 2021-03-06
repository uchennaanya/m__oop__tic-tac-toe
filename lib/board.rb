# Create Board

class Board
  attr_reader :board_size, :availible_spaces, :win, :draw
  def initialize
    @board_size = 3
    @availible_spaces = []
    (@board_size**2).times do |x|
      x += 1
      @availible_spaces << x
    end
  end

  def space_selection(pick, mark, choices)
    if @availible_spaces.include?(pick)
      @availible_spaces[pick - 1] = mark
      choices << pick
    else
      puts 'Please select a valid option'
      print '> '
      choice = gets.chomp.to_i
      choices << choice
      space_selection(choice, mark, choices)
    end
  end

  def win_validation(player_pick)
    winning_list = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    winning_list.any? { |combination| combination.all? { |x| player_pick.include?(x) } }
  end

  def draw_validation
    @availible_spaces.all? { |x| @draw = true if x.class == String }
  end
end
