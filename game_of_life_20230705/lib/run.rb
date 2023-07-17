# frozen_string_literal: true

require 'curses'
require_relative 'game-of-life'

# Colors
GRASS_PAIR = 1
WATER_PAIR = 2
MOUNTAIN_PAIR = 3
FIRE_PAIR = 4

Curses.start_color

Curses.init_pair(GRASS_PAIR, Curses::COLOR_YELLOW, Curses::COLOR_GREEN)
Curses.init_pair(WATER_PAIR, Curses::COLOR_CYAN, Curses::COLOR_BLUE)
Curses.init_pair(MOUNTAIN_PAIR, Curses::COLOR_BLACK, Curses::COLOR_WHITE)
Curses.init_pair(FIRE_PAIR, Curses::COLOR_RED, Curses::COLOR_MAGENTA)

class Animate
  def initialize(row, col)
    @game = GameOfLife.new(row, col)
    Curses.init_screen
    Curses.nl
    Curses.noecho
    Curses.curs_set 0
  end

  def place_string(y, x, color, string)
    Curses.attrset(Curses.color_pair(color))

    Curses.setpos(y, x)
    Curses.addstr(string)
  end

  def init_random
    @game.traverse_cells do |row, column, _value|
      @game.setLivingCell([row, column]) if rand(2) == 1
    end
  end

  # some examples from https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#Examples_of_patterns

  def init_block
    # init 2x2 'block' starting state
    @game.setLivingCell([1, 1], [1, 2], [2, 2], [2, 1]) # block
  end

  def init_glider
    @game.setLivingCell([2, 3], [3, 1], [3, 3], [4, 2], [4, 3]) # glider
  end

  def init_blinker
    @game.setLivingCell([2, 1], [2, 2], [2, 3]) # blinker
  end

  def init_beacon
    @game.setLivingCell([1, 1], [2, 1], [1, 2], [4, 3], [3, 4], [4, 4]) # beacon
  end

  def init_combination
    @game.setLivingCell([0, 12], [1, 12], [2, 12], [1, 6], [2, 7], [0, 8], [1, 8], [2, 8]) # combination
  end

  def init_gosper_gun
    @game.setLivingCell([5, 1], [5, 2], [6, 1], [6, 2], [5, 11], [6, 11], [7, 11], [4, 12], [3, 13], [3, 14], [8, 12],
                        [9, 13], [9, 14], [6, 15], [4, 16], [5, 17], [6, 17], [7, 17], [6, 18], [8, 16], [3, 21], [4, 21], [5, 21], [3, 22], [4, 22], [5, 22], [2, 23], [6, 23], [1, 25], [2, 25], [6, 25], [7, 25], [3, 35], [4, 35], [3, 36], [4, 36])
  end

  def init_pulsar
    @game.setLivingCell([10, 10], [11, 10], [12, 10], [10, 14], [11, 14], [12, 14], [10, 16], [11, 16], [12, 16], [10, 20], [11, 20], [12, 20],
                        [9, 11], [9, 12], [9, 13], [9, 17], [9, 18], [9, 19], [13, 11], [13, 12], [13, 13], [13, 17], [13, 18], [13, 19],
                        [16, 10], [17, 10], [18, 10], [16, 14], [17, 14], [18, 14], [16, 16], [17, 16], [18, 16], [16, 20], [17, 20], [18, 20],
                        [15, 11], [15, 12], [15, 13], [15, 17], [15, 18], [15, 19], [19, 11], [19, 12], [19, 13], [19, 17], [19, 18], [19, 19]) # pulsar
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
        pic = cell_state == GameOfLife::DEAD_CELL ? '.' : '#'
        place_string(row, column, color, pic)
      end

      # tick_count indicator
      place_string(@game.no_rows - 1, @game.no_columns - 1, MOUNTAIN_PAIR, (tick_count % 10).to_s)

      Curses.refresh
      sleep(0.1)
    end
  end
end

life = Animate.new(Curses.lines, Curses.cols)

if ARGV.include? 'glider'
  life.init_glider
elsif ARGV.include? 'block'
  life.init_block
elsif ARGV.include? 'blinker'
  life.init_blinker
elsif ARGV.include? 'beacon'
  life.init_beacon
elsif ARGV.include? 'pulsar'
  life.init_pulsar
elsif ARGV.include? 'combination'
  life.init_combination
elsif ARGV.include? 'gosper_gun'
  life.init_gosper_gun
else
  life.init_random
end
life.run
