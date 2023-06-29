class Tennis
  POINT_TRANSLATOR = ["Love", "15", "30", "40"]
  def initialize
    @points = 0
  end

  def score(player = nil)
    @points += 1 if player
    return "#{POINT_TRANSLATOR[@points]} All" if @points == 0
    "#{POINT_TRANSLATOR[@points]} #{POINT_TRANSLATOR[0]}"
  end
end