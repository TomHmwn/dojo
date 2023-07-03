# frozen_string_literal: true

class Tennis
  POINT_TRANSLATOR = %w[Love 15 30 40].freeze
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
    return output(nil,"Deuce") if same_score
    win_on_advantage ? (server_winning ? output("Server", "Game") : output("Receiver", "Game")) : server_winning ? output("Server", "Advantage") : output("Receiver", "Advantage")
  end

  def winning?
    @points.values.any? { |point| point >= 4}
  end

  def winning_score
    server_winning ? output("Server", "Game") : output("Receiver", "Game")
  end

  def normal_score
    same_score ? output(nil, "All") : output
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

  def output(player = nil, match = nil)
    case match
    when "Game"
      "#{match} #{player}"
    when "Advantage"
      "#{match} #{player}"
    when "Deuce"
      "#{match}"
    when "All"
      "#{POINT_TRANSLATOR[@points[:server]]} #{match}"
    else
      "#{POINT_TRANSLATOR[@points[:server]]} #{POINT_TRANSLATOR[@points[:receiver]]}"
    end
  end
end