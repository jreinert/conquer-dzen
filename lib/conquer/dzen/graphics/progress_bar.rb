require 'conquer/dzen/graphics/graphic'
require 'conquer/dzen/graphics/rectangle'

module Conquer
  module Dzen
    module Graphics
      class ProgressBar < Graphic
        attr_reader :progress, :width, :height, :orientation

        def initialize(progress, width, height, orientation = :horizontal)
          super()
          @progress = progress
          @width = width
          @height = height
          @orientation = orientation
          @template = '^ib(1)^p(_LOCK_X)%s%s^p(_UNLOCK_X)^ib(0)'
          @template << shift(width, 0)
          @template_args = [outline, fill]
        end

        private

        def horizontal_fill
          Rectangle.new(width * progress / 100.0, height)
        end

        def vertical_fill
          fill_height = height * progress / 100.0
          y_shift = height - fill_height
          Rectangle.new(width, fill_height).move(0, y_shift)
        end

        def fill
          orientation == :horizontal ? horizontal_fill : vertical_fill
        end

        def outline
          RectangleOutline.new(width, height)
        end
      end
    end
  end
end
