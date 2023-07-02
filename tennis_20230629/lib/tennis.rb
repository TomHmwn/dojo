# frozen_string_literal: true

class Tennis
  POINT_TRANSLATOR = %w[Love 15 30 40 Deuce Advantage Game].freeze
  def initialize
    @points = { server: 0, reciever: 0 }
  end

  def score(player = nil)
    increment_point(player) if player

    return deuce_score if deuce?

    # win a game
    if @points.values.any? { |point| point >= 4 }
      if @points[:server] > @points[:reciever]
        return "#{POINT_TRANSLATOR[6]} Server"
      elsif @points[:server] < @points[:reciever]
        return "#{POINT_TRANSLATOR[6]} Reciever"
      end
    end

    # normal score
    return "#{POINT_TRANSLATOR[@points[:server]]} All" if @points[:server] == @points[:reciever]
    return unless @points.values.all? { |point| point <= 3 }
    "#{POINT_TRANSLATOR[@points[:server]]} #{POINT_TRANSLATOR[@points[:reciever]]}"
  end

  private

  def increment_point(player)
    @points[player] += 1
  end

  def deuce?
    @points.values.all? {|point| point >= 3}
  end

  def deuce_score
    if @points[:server] == @points[:reciever]
      POINT_TRANSLATOR[4]
    elsif @points[:server] == @points[:reciever] + 1
      "#{POINT_TRANSLATOR[5]} Server"
    elsif @points[:reciever] == @points[:server] + 1
      "#{POINT_TRANSLATOR[5]} Receiver"
    end
  end
end
