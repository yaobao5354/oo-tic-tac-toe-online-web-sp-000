class TicTacToe
  
  WIN_COMBINATIONS = [ 
  [0,1,2], [3,4,5], [6,7,8], 
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6] ]
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(index)
    index = index.to_i - 1
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  
  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index)  
    elsif index >= 0 && index <= 8 
      true
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |token|
      if token != " "
      counter += 1
      end
    end
    return counter
  end
  
  def current_player
    if turn_count.even? 
      return "X"
    else
      return "O"
    end
  end 

  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
    
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else 
        false
      end
    end
    false
  end 
  
  def full?
    @board.each do |token|
      if token == " "
        return false
      end
    end
  end 
  
  def draw?
    if won?
      return false
    elsif full? == false
      return false
    end
    true
  end 

  def over?
    if won?
      return true
    elsif draw?
      return true
    end
    false
  end 
  
  def winner
    if won?
      token = @board[won?[0]]
      return token
    end 
    return nil
  end 

  def play
    while over? == false
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end
  end 

end 