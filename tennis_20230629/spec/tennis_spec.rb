require "tennis"

RSpec.describe Tennis do

  [
    {server: 0, reciever: 0, score: "Love All"},
    {server: 1, reciever: 0, score: "15 Love"},
    {server: 2, reciever: 0, score: "30 Love"},
    {server: 3, reciever: 0, score: "40 Love"},
    {server: 0, reciever: 1, score: "Love 15"},
    {server: 0, reciever: 2, score: "Love 30"},
    {server: 0, reciever: 3, score: "Love 40"},
    {server: 1, reciever: 1, score: "15 All"},
    {server: 2, reciever: 2, score: "30 All"},
    {server: 3, reciever: 3, score: "Deuce"},
    {server: 4, reciever: 3, score: "Advantage Server"},
    {server: 4, reciever: 4, score: "Deuce"},
    {server: 4, reciever: 5, score: "Advantage Reciever"},
    # {server: 4, reciever: 6, score: "Game Reciever"},
    # {server: 4, reciever: 0, score: "Game Server"},
  ].each do |args|
    it "returns #{args[:score].inspect} when Server: #{args[:server]} and Reciever: #{args[:reciever]}" do
      tennis = Tennis.new
      args[:server].times { tennis.score(:server)}
      args[:reciever].times { tennis.score(:reciever)}
      expect(tennis.score).to eq args[:score]
    end
  end
end