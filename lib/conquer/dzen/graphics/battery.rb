require 'conquer/dzen/graphics/progress_bar'
require 'conquer/dzen/graphics/rectangle'

module Conquer
  module Dzen
    module Graphics
      class Battery < ProgressBar
        def initialize(percentage, width, height, orientation = :horizontal)
          super
          @template << '%s'
          @template_args = [outline, fill, plus_pole]
        end

        private

        def plus_pole
          orientation == :horizontal ? vertical_plus_pole : horizontal_plus_pole
        end

        def vertical_plus_pole
          result = Rectangle.new(width / 2.0, height / 4.0)
          result.move((width + result.width) / 2.0, -height)
        end

        def horizontal_plus_pole
          Rectangle.new(height / 4.0, height / 2.0)
        end
      end
    end
  end
end
