class Player
  attr_reader :name, :mark, :id, :curr_board

  @@ID = 1

  def initialize(name, mark, curr_board)
    @name = name
    @mark = mark
    @id = @@ID
    @curr_board = curr_board
    @@ID += 1
  end
end
