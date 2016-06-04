require 'conquer/dzen/positioning'
require 'conquer/dzen/graphics/icon'
require 'conquer/dzen/graphics/rectangle'
require 'conquer/dzen/graphics/rectangle_outline'
require 'conquer/dzen/graphics/circle'
require 'conquer/dzen/graphics/circle_outline'
require 'conquer/dzen/graphics/progress_bar'
require 'conquer/dzen/graphics/battery'

module Conquer
  module Dzen
    module Graphics
      def icon(path)
        Icon.new(path)
      end

      def rectangle(width, height)
        Rectangle.new(width, height)
      end

      def rectangle_outline(width, height)
        RectangleOutline.new(width, height)
      end

      def circle(radius)
        Circle.new(radius)
      end

      def circle_outline(radius)
        CircleOutline.new(radius)
      end

      def progress_bar(progress, width, height, orientation = :horizontal)
        ProgressBar.new(progress, width, height, orientation)
      end

      def battery(percentage, width, height, orientation = :horizontal)
        Battery.new(percentage, width, height, orientation)
      end
    end
  end
end
