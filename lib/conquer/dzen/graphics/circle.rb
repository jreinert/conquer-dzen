require 'conquer/dzen/graphics/rectangle'

module Conquer
  module Dzen
    module Graphics
      class Circle < Graphic
        attr_reader :radius

        def initialize(radius)
          super()
          @radius = radius
          @template = '^c(%d)'
          @template_args = [radius]
        end
      end
    end
  end
end
