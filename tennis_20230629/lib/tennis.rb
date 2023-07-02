# frozen_string_literal: true

class Tennis
  POINT_TRANSLATOR = %w[Love 15 30 40 Deuce Advantage Game].freeze
  def initialize
    @points = { server: 0, receiver: 0 }
  end

  def score(player = nil)
    increment_point(player) if player
    return deuce_and_adv_score if match_point?
    return winning_score if winning?
    normal_score
  end

  private

  def increment_point(player)
    @points[player] += 1
  end

  def match_point?
    @points.values.all? {|point| point >= 3}
  end

  def deuce_and_adv_score
    return POINT_TRANSLATOR[4] if same_score
    win_on_advantage ? (server_winning ? "#{POINT_TRANSLATOR[6]} Server" : "#{POINT_TRANSLATOR[6]} Receiver") : server_winning ? "#{POINT_TRANSLATOR[5]} Server" : "#{POINT_TRANSLATOR[5]} Receiver"
  end

  def winning?
    @points.values.any? { |point| point >= 4}
  end

  def winning_score
    server_winning ? "#{POINT_TRANSLATOR[6]} Server" : "#{POINT_TRANSLATOR[6]} Receiver"
  end

  def normal_score
    same_score ? "#{POINT_TRANSLATOR[@points[:server]]} All" : "#{POINT_TRANSLATOR[@points[:server]]} #{POINT_TRANSLATOR[@points[:receiver]]}"
  end

  def same_score
     @points[:server] == @points[:receiver]
  end

  def server_winning
    @points[:server] > @points[:receiver]
  end

  # def player_advantage
  #   (@points[:server] - @points[:receiver]).abs >= 1
  # end

  def win_on_advantage
    (@points[:server] - @points[:receiver]).abs >= 2
  end
end