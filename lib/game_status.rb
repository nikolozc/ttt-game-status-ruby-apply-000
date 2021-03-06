# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],
[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    win_index1 = combination[0]
    win_index2 = combination[1]
    win_index3 = combination[2]
    
    position1 = board[win_index1]
    position2 = board[win_index2]
    position3 = board[win_index3]
    
    if (position1 == "X" && position2 == "X" && position3 == "X")
      return combination
    elsif (position1 == "O" && position2 == "O" && position3 == "O")
      return combination
    end
  end
  return false
end

def full?(board)
  board.each_index do |index|
    if(!position_taken?(board,index))
      return false
    end
  end
  return true
end

def draw?(board)
  if(full?(board) && !won?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if(full?(board) || draw?(board) || won?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if(!won?(board))
    return nil
  end
  return board[won?(board)[0]]
end