require 'RMagick'

require './lib/bloodsugar.rb'

# Given a BloodSugar instance, display it with several kinds of view.
class BloodSugarView
  # A note about language:
  #
  # WIDTH and HEIGHT refer to pixels.
  # X and Y refer to data.
  #
  HEIGHT_BORDER = 100  # How much height to describe the x-axis
  HEIGHT_GRAPH  = 900  # How much height devoted to y values.
  WIDTH_BORDER  = 100  # How much space to describe the y-axis
  WIDTH_GRAPH  = 1440  # How much width devoted to x values.
  X_MAX        = 1440  # The maximum value that X will show.
  X_TO_WIDTH    = 1.0  # X_MAX * X_TO_WIDTH = WIDTH_GRAPH
  Y_MAX         = 300  # The maximum value that Y will show.
  Y_TO_HEIGHT   = 3.0  # Y_MAX * Y_TO_HEIGHT = HEIGHT_GRAPH

  def initialize(bloodsugar)
    @bloodsugar = bloodsugar
  end

  def convert_x_to_width(x)
    WIDTH_BORDER + (x * X_TO_WIDTH)
  end

  def convert_y_to_height(y)
    HEIGHT_GRAPH - (y * Y_TO_HEIGHT)
  end

  # Draw the axes.
  def draw_axes(canvas)
    axes = Magick::Draw.new
    axes.fill_opacity(0)
    axes.stroke('black')
    axes.stroke_width(4)
    axes.stroke_linecap('round')
    axes.stroke_linejoin('round')
    axes.polyline(convert_x_to_width(0), convert_y_to_height(Y_MAX),
                  convert_x_to_width(0), convert_y_to_height(0),
                  convert_x_to_width(X_MAX), convert_y_to_height(0))
    axes.draw(canvas)
  end

  # Draw the graph
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw_graph(canvas)
    graph = Magick::Draw.new
    graph.fill_opacity(0)
    graph.stroke('black')
    graph.stroke_width(8)
    graph.stroke_linecap('round')
    graph.stroke_linejoin('round')

    daily_blood_sugar = @bloodsugar.compute(X_MAX)
    (0..(X_MAX - 1)).each do |x|
      if daily_blood_sugar[x] < 150.0
        graph.stroke('black')
      else
        graph.stroke('red')
      end

      graph.line(convert_x_to_width(x),
                 convert_y_to_height(daily_blood_sugar[x]),
                 convert_x_to_width(x + 1),
                 convert_y_to_height(daily_blood_sugar[x + 1]))
    end
    graph.draw(canvas)
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  def initialize_labels
    labels = Magick::Draw.new
    labels.font_weight(Magick::NormalWeight)
    labels.fill('black')
    labels.font_style(Magick::NormalStyle)
    labels.pointsize(20)

    labels
  end

  # Draw x axis labels
  def draw_x_axis(canvas)
    x_labels = initialize_labels
    x_labels.gravity(Magick::NorthGravity)
    x_labels.text_align(Magick::CenterAlign)

    range = (0..X_MAX)
    range.step(100) do |x|
      x_labels.text(convert_x_to_width(x),
                    convert_y_to_height(0) + 30,
                    x.to_s)
    end
    x_labels.draw(canvas)
  end

  # Draw the y axis labels
  def draw_y_axis(canvas)
    y_labels = initialize_labels
    y_labels.gravity(Magick::EastGravity)
    y_labels.text_align(Magick::RightAlign)

    range = (0..Y_MAX)
    range.step(50) do |y|
      y_labels.text(convert_x_to_width(0) - 10,
                    convert_y_to_height(y),
                    y.to_s)
    end
    y_labels.draw(canvas)
  end

  # The main routine!
  def output_graph(filename)
    canvas = Magick::ImageList.new
    canvas.new_image(WIDTH_GRAPH + WIDTH_BORDER,
                     HEIGHT_GRAPH + HEIGHT_BORDER,
                     Magick::HatchFill.new('white', 'gray90'))

    draw_axes(canvas)
    draw_graph(canvas)
    draw_x_axis(canvas)
    draw_y_axis(canvas)

    canvas.write(filename)
  end

  def output_text
    puts "Glycation = #{@bloodsugar.glycation(1440)}"
  end
end
