require "tennis"

RSpec.describe Tennis do

  [
    {server: 0, reciever: 0, score: "Love All"},
    {server: 1, reciever: 0, score: "15 Love"},
    {server: 2, reciever: 0, score: "30 Love"},
    {server: 3, reciever: 0, score: "40 Love"},
    {server: 0, reciever: 1, score: "Love 15"},
  ].each do |args|
    it "returns #{args[:score].inspect} when Server: #{args[:server]} and Reciever: #{args[:reciever]}" do
      tennis = Tennis.new
      args[:server].times { tennis.score(:server)}
      args[:reciever].times { tennis.score(:reciever)}
      expect(tennis.score).to eq args[:score]
    end
  end
end