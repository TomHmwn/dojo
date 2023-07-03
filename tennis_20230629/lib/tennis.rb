# frozen_string_literal: true
class PointTranslator
  POINTS = %w[Love 15 30 40].freeze

  def self.translate(point)
    POINTS[point]
  end
end

class ScoreConditionChecker
  def self.winning?(points)
    (points[:server] >= 4 || points[:receiver] >= 4) && leading_by_2?(points)
  end

  def self.leading_by_2?(points)
    (points[:server] - points[:receiver]).abs >= 2
  end

  def self.leading_by_1?(points)
    (points[:server] - points[:receiver]).abs >= 1
  end

  def self.same_score?(points)
    points[:server] == points[:receiver]
  end

  def self.server_winning?(points)
    points[:server] > points[:receiver]
  end
end

class Tennis
  def initialize
    @points = { server: 0, receiver: 0 }
  end

  def score(player = nil)
    increment_point(player) if player
    return winning_score if winning?
    return match_point_score if match_point?
    normal_score
  end

  private

  def increment_point(player)
    @points[player] += 1
  end

  def match_point?
    @points.values.all? {|point| point >= 3}
  end

  def match_point_score
    return output(nil,"Deuce") if ScoreConditionChecker.same_score?(@points)
    (ScoreConditionChecker.server_winning?(@points) ? output("Server", "Advantage") : output("Receiver", "Advantage")) if ScoreConditionChecker.leading_by_1?(@points)
  end

  def winning?
    ScoreConditionChecker.winning?(@points)
  end

  def winning_score
    (ScoreConditionChecker.server_winning?(@points) ? output("Server", "Game") : output("Receiver", "Game"))
  end

  def normal_score
    ScoreConditionChecker.same_score?(@points) ? output(nil, "All") : output
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
      "#{PointTranslator.translate(@points[:server])} #{match}"
    else
      "#{PointTranslator.translate(@points[:server])} #{PointTranslator.translate(@points[:receiver])}"
    end
  end
end