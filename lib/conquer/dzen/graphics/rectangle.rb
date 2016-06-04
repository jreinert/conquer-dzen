require 'conquer/dzen/graphics/graphic'

module Conquer
  module Dzen
    module Graphics
      class Rectangle < Graphic
        attr_reader :width, :height

        def initialize(width, height)
          super()
          @width = width
          @height = height
          @template = '^r(%dx%d)'
          @template_args = [width, height]
        end
      end
    end
  end
end
