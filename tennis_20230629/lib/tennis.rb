class Tennis
  POINT_TRANSLATOR = ["Love", "15", "30", "40"]
  def initialize
    @points = {server: 0, reciever: 0}
  end

  def score(player = nil)
    @points[player] += 1 if player
    return "#{POINT_TRANSLATOR[@points[:server]]} All" if @points[:server] == @points[:reciever]
    "#{POINT_TRANSLATOR[@points[:server]]} #{POINT_TRANSLATOR[@points[:reciever]]}"
  end
end