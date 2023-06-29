require "tennis"

RSpec.describe Tennis do

  [
    {server: 0, reciever: 0, score: "Love All"},
    {server: 1, reciever: 0, score: "15 Love"},
    {server: 2, reciever: 0, score: "30 Love"},
    {server: 3, reciever: 0, score: "40 Love"},
  ].each do |args|
    it "returns #{args[:score].inspect} when Server: #{args[:server]} and Reciever: #{args[:reciever]}" do
      tennis = Tennis.new
      args[:server].times { tennis.score(:server)}
      args[:reciever].times { tennis.score(:reciever)}
      expect(tennis.score).to eq args[:score]
    end
  end

  it "Starts the game with Love All" do
    tennis = Tennis.new
    0.times { tennis.score(:server)}
    expect(tennis.score).to eq "Love All"
  end

  it "returns 15 Love if server wins a point" do
    tennis = Tennis.new
    1.times { tennis.score(:server)}
    expect(tennis.score).to eq "15 Love"
  end

  it "returns 30 Love if server wins two point" do
    tennis = Tennis.new
    2.times { tennis.score(:server) }
    expect(tennis.score).to eq "30 Love"
  end

  it "returns 40 Love if server wins three point" do
    tennis = Tennis.new
    3.times { tennis.score(:server) }
    expect(tennis.score).to eq "40 Love"
  end
end