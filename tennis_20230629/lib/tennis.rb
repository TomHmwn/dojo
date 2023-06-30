class Tennis
  POINT_TRANSLATOR = ["Love", "15", "30", "40"]

  def initialize
    @points = {server: 0, reciever: 0}
  end

  def score(player = nil)
    @points[player] += 1 if player
    if @points[:server] == @points [:reciever] && @points[:server] == 3
      return "Deuce"
    elsif @points[:server] == @points[:reciever]
      return "#{POINT_TRANSLATOR[@points[:server]]} All"
    end
    "#{POINT_TRANSLATOR[@points[:server]]} #{POINT_TRANSLATOR[@points[:reciever]]}"
  end
end