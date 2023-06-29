require "tennis"

RSpec.describe Tennis do
  it "Starts the game with Love All" do
    tennis = Tennis.new
    expect(tennis.score).to eq "Love All"
  end
end