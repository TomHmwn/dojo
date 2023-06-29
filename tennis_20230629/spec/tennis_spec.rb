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

  it "returns 30 Love if server wins two point" do
    tennis = Tennis.new
    tennis.score(:server)
    expect(tennis.score(:server)).to eq "30 Love"
  end

end