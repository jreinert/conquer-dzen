require 'conquer/dzen/positioning'

module Conquer
  module Dzen
    module Graphics
      class Graphic
        include Positioning

        def initialize
          @x_shift = 0
          @y_shift = 0
        end

        def move(x, y)
          @x_shift += x
          @y_shift += y
          self
        end

        def to_s
          shift(@x_shift, @y_shift) { render }
        end

        private

        def render
          format(@template, *@template_args)
        end
      end
    end
  end
end
