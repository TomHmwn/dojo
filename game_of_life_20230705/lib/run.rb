require "curses"
require_relative "game-of-life"

class Animate

  # colors
  GRASS_PAIR = 1
  WATER_PAIR = 2
  MOUNTAIN_PAIR = 3
  FIRE_PAIR = 4
  Curses.init_pair(GRASS_PAIR, Curses::COLOR_YELLOW, Curses::COLOR_GREEN)
  Curses.init_pair(WATER_PAIR, Curses::COLOR_CYAN, Curses::COLOR_BLUE)
  Curses.init_pair(MOUNTAIN_PAIR, Curses::COLOR_BLACK, Curses::COLOR_WHITE)
  Curses.init_pair(FIRE_PAIR, Curses::COLOR_RED, Curses::COLOR_MAGENTA)

  def place_string(y, x, color, string)
    Curses.attrset(Curses.color_pair(color))

    Curses.setpos(y, x)
    Curses.addstr(string)
  end

  def initialize
    # curses setup stuff
    Curses.init_screen
    Curses.nl
    Curses.noecho
    Curses.curs_set 0
    Curses.start_color # enable color output
    @game = GameOfLife.new(10,10)
    @game.setLivingCell( [2, 3], [3, 1], [3,3], [4,2], [4,3] )
  end

  def run
    tick_count = 0
    loop do
      tick_count += 1

      # update world
      @game.computeNextGeneration

      # render screen
      @game.traverse_cells do |row, column, cell_state|
        color = cell_state == GameOfLife::DEAD_CELL ? MOUNTAIN_PAIR : GRASS_PAIR
        pic = cell_state == GameOfLife::DEAD_CELL ? "." : "#"
        place_string(row, column, color, pic)
      end

      # tick_count indicator
      place_string(@game.no_rows - 1, @game.no_columns - 1, MOUNTAIN_PAIR, (tick_count % 10).to_s)

      Curses.refresh
      sleep(0.1)
    end
  end
end

life = Animate.new
life.run

