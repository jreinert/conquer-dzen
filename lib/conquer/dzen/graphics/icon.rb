require 'conquer/dzen/graphics/graphic'

module Conquer
  module Dzen
    module Graphics
      class Icon < Graphic
        attr_reader :path

        def initialize(path)
          super()
          @path = path
          @template = '^i(%s)'
          @template_args = [path]
        end
      end
    end
  end
end
