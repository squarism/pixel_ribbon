require 'chunky_png'
require 'oily_png'

class PixelRibbon
  attr_accessor :num_tiles
  attr_reader :canvas

  def initialize
    @num_tiles = 24
    @width = 576
    @height = 24
  end

  def pixel_ribbon theme
    @canvas = ChunkyPNG::Canvas.new @width, @height, ChunkyPNG::Color.from_hex('#ffffff')

    @num_tiles.times do |offset|
      colors = theme[:colors]
      color = random_color(colors)
      x1 = offset * 24
      x2 = (offset + 1) * 24 - 1
      @canvas.rect(x1, -1, x2, @height, ChunkyPNG::Color::TRANSPARENT, color)
    end

    save @canvas, theme[:name]
  end

  # select a non repeating random color, no colors next to each other
  def random_color swatch
    until @random_color != @previous_color do
      @random_color = swatch.sample
    end
    @previous_color = @random_color
    @random_color
  end

  def save ribbon, swatch_name
    pwd = File.dirname(__FILE__)
    swatch_name.downcase!
    swatch_name.gsub!(/\s+/, '_')
    filename = "#{pwd}/../img/pixel-ribbon_#{swatch_name}.png"
    ribbon.save(filename, :interlace => true)
  end

end