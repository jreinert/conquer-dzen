require 'conquer/dzen/graphics/rectangle'

module Conquer
  module Dzen
    module Graphics
      class RectangleOutline < Rectangle
        def initialize(*)
          super
          @template = '^ro(%dx%d)'
        end
      end
    end
  end
end
