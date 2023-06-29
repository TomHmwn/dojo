require "tennis"

RSpec.describe Tennis do
  it "Starts the game with Love All" do
    tennis = Tennis.new
    expect(tennis.score).to eq "Love All"
  end

  it "returns 15 Love if server wins a point" do
    tennis = Tennis.new
    expect(tennis.score(:server)).to eq "15 Love"
  end
end