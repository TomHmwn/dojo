
class LifeBoard
  attr_accessor :no_columns, :no_rows, :grid_array

  def initialize(no_rows = 3, no_columns = 3)
    @no_rows = no_rows
    @no_columns = no_columns
  end

  # def build_array_for_grid
  #   build_columns = Array.new
  #   i = 0
  #   while i <no_columns do
  #     random_life = =rand(0..100)
  #     build_columns << Cell.new(random_life)
  #   end
  #   @grid_array = Array.new
  #   no_rows.times do
  #     @grid_array << build_columns
  #   end
  # end


end