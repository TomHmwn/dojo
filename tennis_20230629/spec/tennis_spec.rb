# frozen_string_literal: true

require 'tennis'

RSpec.describe Tennis do
  [
    { server: 0, receiver: 0, score: 'Love All' },
    { server: 1, receiver: 0, score: '15 Love' },
    { server: 2, receiver: 0, score: '30 Love' },
    { server: 3, receiver: 0, score: '40 Love' },
    { server: 0, receiver: 1, score: 'Love 15' },
    { server: 0, receiver: 2, score: 'Love 30' },
    { server: 0, receiver: 3, score: 'Love 40' },
    { server: 1, receiver: 1, score: '15 All' },
    { server: 2, receiver: 2, score: '30 All' },
    { server: 3, receiver: 3, score: 'Deuce' },
    { server: 4, receiver: 4, score: 'Deuce' },
    { server: 4, receiver: 3, score: 'Advantage Server' },
    { server: 4, receiver: 0, score: 'Game Server' },
    { server: 4, receiver: 5, score: 'Advantage Receiver' },
    { server: 4, receiver: 6, score: 'Game Receiver' }
  ].each do |args|
    it "returns #{args[:score].inspect} when Server: #{args[:server]} and Receiver: #{args[:receiver]}" do
      tennis = Tennis.new
      args[:server].times { tennis.score(:server) }
      args[:receiver].times { tennis.score(:receiver) }
      expect(tennis.score).to eq args[:score]
    end
  end
end
