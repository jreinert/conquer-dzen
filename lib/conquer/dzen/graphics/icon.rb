require 'conquer/dzen/graphics/graphic'

module Conquer
  module Dzen
    module Graphics
      class Icon < Graphic
        ICONS_PATH = File.expand_path('../../../../../icons', __FILE__)
        attr_reader :path

        def initialize(path)
          super()
          path = File.join(ICONS_PATH, "#{path}.xbm") if path.is_a?(Symbol)
          @path = path
          @template = '^i(%s)'
          @template_args = [path]
        end
      end
    end
  end
end
