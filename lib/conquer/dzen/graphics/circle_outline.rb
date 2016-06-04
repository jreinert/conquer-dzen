require 'conquer/dzen/graphics/circle'

module Conquer
  module Dzen
    module Graphics
      class CircleOutline < Circle
        def initialize(*)
          super
          @template = '^co(%d)'
        end
      end
    end
  end
end
